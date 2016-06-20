require 'spec_helper'

feature 'Article Creation' do
  before(:each) do
    auto_sign_in
  end

  scenario 'allows user to visit new_article page' do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.new_article')
  end

  scenario 'allows user to add new article' do
    visit new_article_path
    fill_in :article_title, :with => 'New Article title'
    fill_in :article_text, :with => 'New Article text'
    click_button 'Submit'
    expect(page).to have_content 'New Article title'
  end

  scenario 'allows user to add new article' do
    visit new_article_path
    fill_in :article_title, :with => 'New Article title'
    fill_in :article_text, :with => 'New Article text'
    click_button 'Submit'
    
    visit '/articles/1'
    fill_in :comment_body, :with => 'TestComment'
    click_button 'Submit comment'
    expect(page).to have_content 'TestComment'
  end
end
