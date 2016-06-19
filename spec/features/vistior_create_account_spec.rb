require 'spec_helper'

feature 'Account Creation' do

  scenario 'allows a guest to create account' do
    auto_sign_in
    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end

end
