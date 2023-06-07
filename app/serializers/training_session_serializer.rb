class TrainingSessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :coach_id, :sets, :reps, :distance, :duration, :recovery, :training_type, :day, :rpe, :initiation, :footwear, :surface, :extra_info, :pacing_times, :media
end
