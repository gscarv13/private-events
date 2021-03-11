# rubocop: disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Users' do
  before(:all) do
    @user = User.create(username: 'NewUser2')
  end

  before(:each) do
    visit new_user_path
  end

  context 'create new user' do
    scenario 'should be sucessful' do
      within('form') do
        fill_in 'Username', with: 'NewUser'
      end

      click_on('Create User')
      expect(page).to have_content('Welcome NewUser')
    end

    scenario 'should not allow duplicated username' do
      within('form') do
        fill_in 'Username', with: 'NewUser2'
      end

      click_on('Create User')
      expect(page).to have_content('Username has already been taken')
    end
  end

  context 'sign in' do
    scenario 'successful' do
      visit login_path

      within('form') do
        fill_in 'Username', with: @user.username
      end

      click_on('Login')
      expect(page).to have_content('Login Successful')
    end

    scenario 'fail to login' do
      visit login_path
      within('form') do
        fill_in 'Username', with: 'NonRegisteredUser'
      end

      click_on('Login')
      expect(page).to have_content('User not found')
    end
  end

  context 'sign out' do
    scenario 'successful' do
      visit login_path

      within('form') do
        fill_in 'Username', with: @user.username
      end

      click_on('Login')
      click_on('Log out')
      expect(page).to have_content('Log Out Successful')
    end
  end
end
# rubocop: enable Metrics/BlockLength
