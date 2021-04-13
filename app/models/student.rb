class Student < ApplicationRecord

  validates_presence_of :name, :age, :house

  it {should have_many(:courses).through(:student_courses)}
end
