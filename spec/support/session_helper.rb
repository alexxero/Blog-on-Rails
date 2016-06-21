def auto_sign_in
  visit new_user_registration_path
  fill_in :user_username, :with => 'UserAccount12'
  fill_in :user_email, :with => 'user12@example.com'
  fill_in :user_password, :with => '123456'
  fill_in :user_password_confirmation, :with => '123456'
  click_button 'Sign up'
end