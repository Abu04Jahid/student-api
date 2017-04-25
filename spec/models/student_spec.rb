require 'rails_helper'

RSpec.describe Student, type: :model do
   it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:student_name) }
  it { should validate_presence_of(:roll) }
end
