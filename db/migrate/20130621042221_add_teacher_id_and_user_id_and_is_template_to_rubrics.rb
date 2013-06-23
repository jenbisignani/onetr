class AddTeacherIdAndUserIdAndIsTemplateToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :template_id, :integer
  end
end
