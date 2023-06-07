json.extract! training_session, :id, :name, :description, :coach_id, :sets, :reps, :distance, :duration, :recovery, :training_type, :day, :rpe, :initiation, :footwear, :surface, :extra_info, :pacing_times, :media, :created_at, :updated_at
json.url training_session_url(training_session, format: :json)
