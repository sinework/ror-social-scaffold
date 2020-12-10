require 'rails_helper'

RSpec.describe 'Friendships', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/friendships/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /confirm_request' do
    it 'returns http success' do
      get '/friendships/confirm_request'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /add_friend' do
    it 'returns http success' do
      get '/friendships/add_friend'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /unfriend' do
    it 'returns http success' do
      get '/friendships/unfriend'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /freind_list' do
    it 'returns http success' do
      get '/friendships/freind_list'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /people_you_may_know' do
    it 'returns http success' do
      get '/friendships/people_you_may_know'
      expect(response).to have_http_status(:success)
    end
  end
end
