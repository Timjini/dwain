class TrainingsController < ApplicationController
    require 'csv'

    def index
        @trainings = Training.all
    end

    def show
        @training = Training.find(params[:id])
    end


    def new
        @training = Training.new
    end

    def create
        @training = Training.new(training_params)
        if @training.save
            flash[:success] = "Training created!"
            redirect_to @training
        else
            flash[:error] = "Training not created!"
            render 'new'
        end
    end

    def bulk_create
        uploaded_file = params[:file]

        if uploaded_file.present? && uploaded_file.content_type == 'text/csv'
            path = Rails.root.join('public', 'uploads', 'tmp', uploaded_file)
            list = CSV.read(path, headers: true, encoding: "utf-8")

            if !list.nil? && !list.empty?
            list.each do |row|
                t = Training.new
                t.date = parse_csv_date(row['date']) # Make sure the header name is 'date'
                t.session_100m_200m = row['session_100m_200m']
                t.distance_100m_200m = row['distance_100m_200m']
                t.session_200m_400m = row['session_200m_400m']
                t.distance_200m_400m = row['distance_200m_400m']
                t.sets_reps = row['sets_reps']
                t.recovery = row['recovery']
                t.effort = row['effort']
                t.volume = row['volume']
                t.media = row['media']
                t.save!
            end
            end

            flash[:success] = "Training Sessions created successfully!"
            redirect_to trainings_path
        else
            flash[:alert] = "Please upload a valid CSV file."
            redirect_to new_trainings_path
        end
    end


    def parse_csv_date(date_string)
        date_format = "%d.%m.%Y"
        Date.strptime(date_string, date_format)
    end


    private

    def training_params
        params.require(:training).permit(:date, :session_100m_200m, :distance_100m_200m, :session_200m_400m, :distance_200m_400m, :sets_reps, :recovery, :effort, :volume, :media)
    end
end