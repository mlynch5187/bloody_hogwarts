require 'rails_helper'

RSpec.describe "Course index", type: :feature do
  before(:each) do
    @student1 = Student.create(name: "Alex", age: 33, house: "Lynch")
    @student2 = Student.create(name: "Mike", age: 72, house: "Lynch")
    @history = @student1.courses.create(name: "History 101")
    @biology = @student1.courses.create(name: "Biology 101")
    @math = @student2.courses.create(name: "Math 101")
  end

  it "Shows a list of courses and number of students taking each course" do
    visit "/courses"

    expect(page).to have_content("History 101")
    expect(page).to have_content(@history.students.length)
    expect(page).to have_content("Biology 101")
    expect(page).to have_content(@biology.students.length)
    expect(page).to have_content("Math 101")
    expect(page).to have_content(@math.students.length)
  end
end
