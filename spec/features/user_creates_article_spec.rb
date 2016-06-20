require 'spec_helper'

feature 'Article Creation' do
  before(:all) do
    auto_sign_in
  end

  scenario 'allows user to visit new_article page' do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.new_article')
  end

end
