class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.references :coach, null: false, foreign_key: true
      t.string :title
      t.date :release_date
      t.string :video_link
      t.text :description

      t.timestamps
    end
  end
end
