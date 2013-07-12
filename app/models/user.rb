class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :type

  validates_uniqueness_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name


  has_many :rubrics_given, :class_name => "Rubric", :foreign_key => "teacher_id"
  has_many :rubrics_received, :class_name => "Rubric", :foreign_key => "student_id"
  has_many :rubric_line_items_given, :class_name => "RubricLineItem", :through => :rubrcs_given


  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end
end
