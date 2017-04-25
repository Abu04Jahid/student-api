class Student < ApplicationRecord
	  # model association
  has_many :items, dependent: :destroy

  # validations
  validates_presence_of :student_name, :roll
end
