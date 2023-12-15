require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    assert_not user.save, 'Saved the user without an email'
  end

  test 'should save user with valid email and password' do
    user = User.new(email: 'test@example.com', password: 'password')
    assert user.save, 'Failed to save the user with valid email and password'
  end

  # Add more tests as needed for your User model

  # Example Devise tests
  test 'should encrypt password' do
    user = User.new(email: 'test@example.com', password: 'password')
    user.save
    assert_not_equal 'password', user.encrypted_password
  end
end
