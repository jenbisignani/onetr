class Student < User

  has_many :rubrics, :foreign_key => :student_id
  def self.model_name
    User.model_name
  end
end
