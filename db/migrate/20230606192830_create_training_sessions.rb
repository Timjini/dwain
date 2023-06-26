class CreateTrainingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :training_sessions do |t|
      t.string :name
      t.string :description
      t.integer :coach_id
      t.integer :sets
      t.integer :reps
      t.string :distance
      t.string :duration
      t.string :recovery
      t.string :training_type
      t.string :day
      t.string :rpe
      t.string :initiation
      t.string :footwear
      t.string :surface
      t.string :extra_info
      t.string :pacing_times
      t.string :media

      t.timestamps
    end
  end
end
