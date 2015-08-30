require "rails_helper"

feature 'user adds a new course' do
  scenario 'add a valid course' do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.build(:course)
    sign_in_as(user)
    visit new_course_path

    fill_in "Title", with: course.title
    fill_in "Subject", with: course.subject
    fill_in "Description", with: course.description

    click_button "CREATE COURSE"

    expect(page).to have_content("successfully")
    expect(page).to have_content(course.title.upcase)
    expect(page).to have_content(course.subject.upcase)
    expect(page).to have_content(course.description)
  end

  scenario 'add a blank course' do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.build(:course)
    sign_in_as(user)
    visit new_course_path

    click_button "CREATE COURSE"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Subject can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
