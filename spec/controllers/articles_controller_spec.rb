require 'rails_helper'

describe ArticlesController do
  before :each @article=create(:article)
  
  describe 'index' do
    it 'returns articles list' do
      #article=create(:article)
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:articles).length).to eq 1
   end
  end
  
  describe 'show' do
    it 'shows single article' do
      get :show, id: @article.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:article)).not_to eq nil
      expect(assigns(:articles).title).to eq @article.title
    end
  end
end