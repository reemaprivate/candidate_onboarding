# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Onboardings', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/onboardings/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/onboardings/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
