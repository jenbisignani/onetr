class Positive < ActiveRecord::Base
  attr_accessible :description, :name, :rubric_line_item_id, :type

  belongs_to :rubric_line_item
  #belongs_to :rubric#, :through => :rubric_line_item
  #belongs_to :teacher#, :through => :rubric, :class_name => "User", :foreign_key => :teacher_id
  #belongs_to :student#, :through => :rubric, :class_name => "User", :foreign_key => :student_id
end
