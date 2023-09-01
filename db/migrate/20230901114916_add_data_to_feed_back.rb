class AddDataToFeedBack < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :student_perfomance, :jsonb, default: {}
  end
end
