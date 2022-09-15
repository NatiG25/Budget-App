require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index page' do

    feature 'Testing user index page' do
      background { visit users_path }

      scenario 'I can see the user\'s recipe name.' do
        expect(page).to have_content('Note: After signing up please, check your 
            terminal for email confirmation, which will 
            have a link to a new LogIn page.')
      end

      scenario 'I can see the Total food items.' do
        expect(page).to have_content('Log In')
      end
    end
  end
end
