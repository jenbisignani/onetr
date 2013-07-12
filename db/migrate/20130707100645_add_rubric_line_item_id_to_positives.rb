class AddRubricLineItemIdToPositives < ActiveRecord::Migration
  def change
    add_column :positives, :rubric_line_item_id, :integer
  end
end
