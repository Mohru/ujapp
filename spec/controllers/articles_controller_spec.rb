require 'rails_helper'

describe ArticlesController do
  describe 'index' do
    it 'returns articles list' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:articles).length).to eq 0
   end
  end
end