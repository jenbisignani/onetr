class Rubric < ActiveRecord::Base
  attr_accessible :description, :name, :student_id, :teacher_id

  has_many :rubric_line_items

  belongs_to :teacher, :class_name => "User", :foreign_key => "teacher_id"
  belongs_to :student, :class_name => "User", :foreign_key => "student_id"
end
