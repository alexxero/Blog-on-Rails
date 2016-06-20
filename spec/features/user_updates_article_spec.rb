require 'spec_helper'

feature 'Article Updating' do
  before(:each) do
    auto_sign_in
  end

  scenario 'allows user to add new article' do
    visit new_article_path
    fill_in :article_title, :with => 'New Article title'
    fill_in :article_text, :with => 'New Article text'
    click_button 'Submit'

    visit articles_path #'/articles/1'
    click_link('Edit')
    expect(page).to have_content I18n.t('articles.edit_article')
  end
end
