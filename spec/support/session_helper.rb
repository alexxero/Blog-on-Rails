def sign_up
  #visit new_user_registration_path

  fill_in :user_username, :with => 'UserBot'
  fill_in :user_email, :with => 'example@mail.com'
  fill_in :user_password, :with => '1234567'
  fill_in :user_password_confirmation, :with => '1234567'

  click_button 'Sign up'
end