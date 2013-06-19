class AddUserIdToPositives < ActiveRecord::Migration
  def change
    add_column :positives, :teacher_id, :integer
    add_column :positives, :student_id, :integer
  end
end
