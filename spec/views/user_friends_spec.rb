require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Main flow', type: :system do
  let(:test_friend) { User.create(name: 'Friend Test', email: 'john@test.com', password: '123456') }
  let(:test_user) { User.create(name: 'User Test', email: 'new@test.com', password: '123456') }
  describe 'New user' do
    it 'User sign-up is correct' do
      # Home Page
      visit('/')

      # Go to Sign Up page
      click_link('Sign up')

      # Sign up
      sleep 1
      fill_in('user[name]', with: 'Test')
      fill_in('user[email]', with: 'test@email.com')
      fill_in('user[password]', with: '123456')
      fill_in('user[password_confirmation]', with: '123456')
      sleep 1
      click_button('Sign up')

      # Logout
      sleep 1
      click_link('Sign out')
    end
  end
  describe 'Friend request' do
    it 'path is correct' do
      # Access Home Page
      visit('/')

      click_link('Sign up')

      # user Sign up
      sleep 1
      fill_in('user[name]', with: 'user')
      fill_in('user[email]', with: 'new@test.com')
      fill_in('user[password]', with: '123456')
      fill_in('user[password_confirmation]', with: '123456')

      sleep 1
      click_button('Sign up')

      # Logout
      sleep 1
      click_link('Sign out')

      # Login as the friend
      sleep 1
      click_link('Sign up')
      sleep 1

      fill_in('user[name]', with: 'Test')
      fill_in('user[email]', with: 'test@new.com')
      fill_in('user[password]', with: '123456')
      fill_in('user[password_confirmation]', with: '123456')
      sleep 1
      click_button('Sign up')
      sleep 1

      click_link('All users')

      # Logout friend
      sleep 1
      click_link('Sign out')

      sleep 1
      fill_in('user[email]', with: 'new@test.com')
      fill_in('user[password]', with: '123456')
      click_button('Log in')
      sleep 1
    end
  end
end
