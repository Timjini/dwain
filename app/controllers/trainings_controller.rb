class TrainingsController < ApplicationController
    require 'csv'

    def index

        # @training_table = Training.all.paginate(page: params[:page], per_page: 10)
        @trainings = Training.where('date >= ?', Date.today.beginning_of_day)
                      .paginate(page: params[:page], per_page: 10)
        trainings_by_date = Hash.new { |hash, key| hash[key] = [] }

        # Group training data by date
        @training_table = Training.all
        @training_table.each do |training|
        date = training.updated_at.to_date
        trainings_by_date[date] << training
        end

        @current_month_name = Time.now.strftime('%B')

        current_month = Time.now.strftime('%m')
        current_year = Time.now.strftime('%Y') # Use %Y to get the full year

        first_day = Date.new(current_year.to_i, current_month.to_i, 1)
        last_day = Date.new(current_year.to_i, current_month.to_i, -1)

        @days = (first_day..last_day).to_a

        # Create a new array to store date and associated training data
        @days_with_trainings = []

        @days.each do |day|
        day_with_trainings = { date: day, trainings: trainings_by_date[day] || [] }
        @days_with_trainings << day_with_trainings
        end

        @days_with_trainings.sort_by! { |day| day[:date] }

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
            redirect_to "/my_profile"
        end
    end


    def parse_csv_date(date_string)
        date_format = "%d.%m.%Y"
        Date.strptime(date_string, date_format)
    end

    def generate_calendar_data
    require 'date'

    # Get the current date
    current_date = Date.today

    # Get the first day of the current month
    first_day_of_month = current_date - (current_date.day - 1)

    # Get the last day of the current month
    last_day_of_month = (first_day_of_month >> 1) - 1

    # Create an array of day names
    day_names = %w[Sun Mon Tue Wed Thu Fri Sat]

    # Create an empty array to store the calendar rows
    calendar_rows = []

    # Create the first row of the calendar with padding for the first day
    first_week = first_day_of_month.wday.times.map { nil }

    # Fill in the days of the first week
    first_week += (first_day_of_month..[first_day_of_month + 6, last_day_of_month].min).to_a

    # Add the first week to the calendar rows
    calendar_rows << first_week

    # Fill in the remaining weeks of the month
    current_week = first_week
    loop do
      # Get the next week
      current_week = (current_week.last.to_i + 1..[current_week.last.to_i + 7, last_day_of_month.day].min).to_a

      # Add the week to the calendar rows
      calendar_rows << current_week

      # Break the loop when the last day of the month is reached
      break if current_week.last.to_i >= last_day_of_month.day
    end

    # Return the calendar data
    {
      month_name: current_date.strftime('%B %Y'),
      day_names: day_names,
      rows: calendar_rows
    }
  end


    private

    def training_params
        params.require(:training).permit(:date, :session_100m_200m, :distance_100m_200m, :session_200m_400m, :distance_200m_400m, :sets_reps, :recovery, :effort, :volume, :media)
    end
end