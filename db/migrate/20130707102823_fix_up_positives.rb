class FixUpPositives < ActiveRecord::Migration
  def up
    add_column :positives, :type, :string
    remove_column :positives, :teacher_id
    remove_column :positives, :student_id
  end

  def down
    remove_column :positives, :type, :string
    add_column :positives, :teacher_id, :integer
    add_column :positives, :student_id, :integer
  end
end
