require 'rails_helper'

RSpec.describe "Student show page", type: :feature do
  before(:each) do
    @student1 = Student.create(name: "Alex", age: 33, house: "Lynch")
    @student2 = Student.create(name: "Mike", age: 72, house: "Lynch")
    @history = @student1.courses.create(name: "History 101")
    @biology = @student1.courses.create(name: "Biology 101")
    @math = @student2.courses.create(name: "Math 101")
  end

    it "Shows a list of student courses" do
      visit "/students/#{@student1.id}"

      expect(page).to have_content("Courses")
      expect(page).to have_content("History 101")
      expect(page).to have_content("Biology 101")
      expect(page).to_not have_content("Math 101")

      visit "/students/#{@student2.id}"

      expect(page).to have_content("Courses")
      expect(page).to_not have_content("History 101")
      expect(page).to_not have_content("Biology 101")
      expect(page).to have_content("Math 101")
  end
end
