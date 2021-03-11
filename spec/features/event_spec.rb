require 'rails_helper'

RSpec.feature "Events", type: :feature do 
  
  context 'create new event' do
    before(:each) do
      visit new_user_path
      within('form') { fill_in 'Username', with: 'NewUser' }
      click_on('Create User')
    end

    scenario 'should be successful' do
      visit new_event_path
      within('form') do
        fill_in 'Name', with: 'Test Event'
        fill_in 'Location', with: 'London, UK'
        fill_in 'Date', with: Time.new.next_month
        fill_in 'Description', with: 'This is a test event'
      end
      click_on('Create Event')
      expect(page).to have_content('Test Event')
    end

    scenario 'should not be successful without date, and preserve correct fields' do
      visit new_event_path
      within('form') do
        fill_in 'Name', with: 'Test Event'
        fill_in 'Location', with: 'London, UK'
        fill_in 'Description', with: 'This is a test event'
      end
      click_on('Create Event')
      expect(page).to have_content('can\'t be blank')
      expect(page).to have_content('Test Event')
    end
  end
end