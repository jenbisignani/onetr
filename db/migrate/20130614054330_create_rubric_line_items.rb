class CreateRubricLineItems < ActiveRecord::Migration
  def change
    create_table :rubric_line_items do |t|
      t.string :name
      t.text :description
      t.integer :rubric_id

      t.timestamps
    end
  end
end
