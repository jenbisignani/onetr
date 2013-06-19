class CreatePositives < ActiveRecord::Migration
  def change
    create_table :positives do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
