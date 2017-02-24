require 'rails_helper'

describe 'add job page' do
  it 'add job' do
    current_user = FactoryGirl.create(:user)
    login_as(current_user)
    visit new_user_job_path(current_user)
    fill_in "Title", with: "Broken Sink"
    fill_in "Description", with: "The sink is clogged."
    click_on "Create Job"
    expect(page).to have_content "Broken Sink"
  end
end
