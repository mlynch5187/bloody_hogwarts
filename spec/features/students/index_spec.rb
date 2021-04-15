require 'rails_helper'

RSpec.describe "Student index", type: :feature do
  before(:each) do
    @student1 = Student.create(name: "Alex", age: 33, house: "Lynch")
    @student2 = Student.create(name: "Mike", age: 72, house: "Lynch")
  end

  it "Shows a list of student names, ages, and house " do
    visit "/students"

    within "#student-#{@student1.id}" do
      expect(page).to have_content("Name")
      expect(page).to have_content(@student1.name)
      expect(page).to have_content("Age")
      expect(page).to have_content(@student1.age)
      expect(page).to have_content("House")
      expect(page).to have_content(@student1.house)
    end

    within "#student-#{@student2.id}" do
      expect(page).to have_content("Name")
      expect(page).to have_content(@student2.name)
      expect(page).to have_content("Age")
      expect(page).to have_content(@student2.age)
      expect(page).to have_content("House")
      expect(page).to have_content(@student2.house)
    end
  end

  it "Shows average age of all students" do
    visit "/students"

    expect(page).to have_content("Average Age")
    expect(page).to have_content("52.5")
  end
end
