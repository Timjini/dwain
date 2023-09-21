class AddUserIdToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_reference :athletes, :user
  end
end
