class RenameColumnAge < ActiveRecord::Migration[7.0]
  def change
    rename_column :athletes , :age , :dob
  end
end
