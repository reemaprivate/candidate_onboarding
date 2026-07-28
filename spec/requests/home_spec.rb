# frozen_string_literal: true

# spec/requests/home_spec.rb

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'returns success' do
      get root_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
