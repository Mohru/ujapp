require 'rails_helper'

feature 'articles' do
  before :each do
    @article=create(:article)
    @second_article=create(:article)
  end
  
  describe 'user visits articles page', type: :feature do
    it 'user sees list of articles' do
      visit articles_path
      
      expect(page).to have_content(@article.title)
      expect(page).to have_content(@second_article.title)
      expect(page).to have_content('© Company 2015')
    end
    
    it 'user creates a new article' do
      visit articles_path
      
      click_link('New article')
      
      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).not_to have_content(@article.title)
      expect(page.current_url).to eq 'http://www.example.com/users/sign_in'
    end
  end
end


