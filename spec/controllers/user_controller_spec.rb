require 'rails_helper'
RSpec.describe UserController, type: :controller do
  describe '#index' do
    it 'respond successfully' do
      get :index
      expect(response).to be_success
    end
    it 'respond in html format' do
      get :index, format: :html
      expect(response.content_type).to eq 'text/html'
    end
    it 'respond in json format' do
      get :index, format: :json
      expect(response.content_type).to eq 'application/json'
    end
  end
end
