require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index page' do

    feature 'Testing user index page' do
      background { visit users_path }

      scenario 'I can see the note for signing up.' do
        expect(page).to have_content('Note: After signing up please')
      end

      scenario 'I can see the Home page title' do
        expect(page).to have_content('BudgetApp')
      end

      scenario 'I can see the SignIn button' do
        expect(page).to have_content('SignUp')
      end

      scenario 'I can see the LogIn button' do
        expect(page).to have_content('LogIn')
      end
    end
  end
end
