class Rubric < ActiveRecord::Base
  attr_accessible :description, :name, :student_id, :teacher_id

  has_many :rubric_line_items

  belongs_to :teacher, :class_name => "User", :foreign_key => "teacher_id"
  belongs_to :student, :class_name => "User", :foreign_key => "student_id"
  belongs_to :template, :class_name => "Rubric", :foreign_key => "template_id"

  def template?
    template_id.nil? && student_id.nil?
  end

  def self.templates_for(user)
    user.rubrics_given.select(&:template?)
  end

  def self.assigned_rubrics_for(user)
    user.rubrics_given.select{|rr| !rr.template?}
  end
end
