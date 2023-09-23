class RenameAthleteTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :athletes, :athlete_profiles 
  end
end
