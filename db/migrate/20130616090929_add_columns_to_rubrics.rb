class AddColumnsToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :student_id, :integer
    add_column :rubrics, :teacher_id, :integer
    add_column :rubric_line_items, :grade, :integer
  end
end
