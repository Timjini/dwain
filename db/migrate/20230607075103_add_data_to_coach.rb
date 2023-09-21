class AddDataToCoach < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :dob, :date
    add_column :coaches, :phone, :string
    add_column :coaches, :username , :string
    add_column :coaches, :first_name, :string
    add_column :coaches, :last_name, :string
    add_column :coaches, :address, :string 
    add_column :coaches, :city, :string
    add_column :coaches, :height, :integer
    add_column :coaches, :weight, :integer
    add_column :coaches, :coach_type, :string
    add_column :coaches, :is_admin, :boolean, default: false
    add_column :coaches, :is_active, :boolean, default: false
  end
end
