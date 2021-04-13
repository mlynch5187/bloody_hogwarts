require 'rails_helper'

RSpec.describe "Student index", type: :feature do
  before(:each) do
    @student1 = Student.create(name: "Alex", age: 33, house: "Lynch")
  end

    it "Shows a list of student names, ages, and house " do
      visit "/students"

      within "#student-#{student1.id}" do
        expect(page).to have_content("Name")
        expect(page).to have_content(student1.name)
        expect(page).to have_content("Age")
        expect(page).to have_content(student1.age)
        expect(page).to have_content("House")
        expect(page).to have_content(student1.house)
    end
  end
end
