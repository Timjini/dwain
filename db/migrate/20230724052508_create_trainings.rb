class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.date :date
      t.string :session_100m_200m
      t.string :distance_100m_200m
      t.string :session_200m_400m
      t.string :distance_200m_400m
      t.string :sets_reps
      t.string :recovery
      t.string :effort
      t.string :volume
      t.string :media

      t.timestamps
    end
  end
end
