class Teacher < User

  has_many :rubrics, :foreign_key => :teacher_id
  has_many :rubric_line_items, :through => :rubrics
  has_many :positives, :through => :rubric_line_items

  def self.model_name
    User.model_name
  end
end
