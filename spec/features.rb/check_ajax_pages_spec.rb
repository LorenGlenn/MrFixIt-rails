require 'rails_helper'

describe 'check ajax' do
  it 'changes status with ajax', js: true do
    current_user = FactoryGirl.create(:user)
    current_worker = FactoryGirl.create(:worker)
    login_as(current_user)
    visit new_job_path
    fill_in "Title", with: "Broken Sink"
    fill_in "Description", with: "The sink is clogged."
    click_on "Create Job"
    logout(current_user)
    login_as(current_worker)
    visit jobs_path
    click_on "Broken Sink"
    click_on "Click here to claim it now"
    visit jobs_path
    click_on "Broken Sink"
    click_on "Click here to mark as being worked"
    visit jobs_path
    click_on "Broken Sink"
    click_on "Click here to mark as completed"
    expect(page).to have_content "You have completed this job!"
  end
end
