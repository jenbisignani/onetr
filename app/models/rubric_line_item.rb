class RubricLineItem < ActiveRecord::Base
  attr_accessible :description, :name, :rubric_id

  belongs_to :rubric
  has_many :positives
end
