class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date
      t.float :amout

      t.timestamps
    end
  end
end
