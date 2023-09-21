class ChangeNameToFeedBack < ActiveRecord::Migration[7.0]
  def change
      rename_column :feedbacks, :student_perfomance, :student_performance
  end
end
