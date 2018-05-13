require 'rails_helper'

RSpec.describe Api::V1::Merchants::FindController, type: :controller do
  describe 'GET index' do
    it 'responds' do
      get :index

      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')
    end
  end
  
  describe 'GET show' do
    it 'responds' do
      get :show

      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')
    end
  end
end
