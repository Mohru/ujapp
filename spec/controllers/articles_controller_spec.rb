require 'rails_helper'

describe ArticlesController do
  before :each do
    @article=create(:article)
  end
  
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
      expect(assigns(:article).title).to eq @article.title
    end
  end
  
  describe 'new' do
    it 'returns new article' do
      @request.env["devise.mapping"]=Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
      get :new
      
      expect(response).to have_http_status(:success)
      expect(assigns(:article)).not_to eq nil
    end
  end
end