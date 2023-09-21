class CreateAthletes < ActiveRecord::Migration[7.0]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :height
      t.string :weight
      t.string :email
      t.string :phone
      t.string :school_name
      t.string :address
      t.string :power_of_ten
      t.timestamps
    end
  end
end
