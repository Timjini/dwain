class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: %i[ show edit update destroy ]
  require 'csv'

  # GET /training_sessions or /training_sessions.json
  def index
      @training_sessions = TrainingSession.includes(:coach).paginate(page: params[:page], per_page: 10)

  end

  # GET /training_sessions/1 or /training_sessions/1.json
  def show
    @training_session = TrainingSession.find(params[:id])
  end

  # GET /training_sessions/new
  def new
    @training_session = TrainingSession.new
  end

  # GET /training_sessions/1/edit
  def edit
  end

  # POST /training_sessions or /training_sessions.json
  def create
    @training_session = TrainingSession.new(training_session_params)

    respond_to do |format|
      if @training_session.save
        format.html { redirect_to training_session_path(@training_session), notice: "Training session was successfully created." }
        format.json { render :show, status: :created, location: @training_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_sessions/1 or /training_sessions/1.json
  def update
    respond_to do |format|
      if @training_session.update(training_session_params.merge(description: params[:description]))
        format.html { redirect_to training_session_path(@training_session), notice: "Training session was successfully created." }
        format.json { render :show, status: :ok, location: @training_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def bulk_create
    uploaded_file = params[:file]

    if uploaded_file.present? && uploaded_file.content_type == 'text/csv'
      #newFileName = upload_file_to_server(params[:csv_file], "df", "content_files/tmp")
      path = Rails.root.join('public', 'uploads', 'tmp', uploaded_file)
      list = CSV.read(path, headers: true, encoding: "utf-8")

      # # Use `tempfile` to get the temporary file path
      # temp_file_path = uploaded_file.tempfile.path

      # # Move the temporary file to the public directory
      # FileUtils.mkdir_p(File.dirname(file_path))
      # FileUtils.mv(temp_file_path, file_path)
      if !list.nil? && !list.empty?
        list.each do |item|
          if !item[0].nil?
            row = item[0].split(';')
            ts = TrainingSession.new
            ts.name = row[0]
            ts.description = row[1]
            ts.media = row[2]
            ts.coach_id = current_coach.id
            ts.save!
          end
        end
      end

      flash[:success] = "Training Sessions created successfully!"
      redirect_to training_sessions_path
    else
      flash[:alert] = "Please upload a valid CSV file."
      redirect_to new_training_session_path
    end
  end

  # DELETE /training_sessions/1 or /training_sessions/1.json
  def destroy
    @training_session.destroy

    respond_to do |format|
      format.html { redirect_to training_session_path, notice: "Training session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_session
      @training_session = TrainingSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_session_params
      params.require(:training_session).permit(:name, :media, :image, :coach_id, :release_date, :description, :day)
    end
end
