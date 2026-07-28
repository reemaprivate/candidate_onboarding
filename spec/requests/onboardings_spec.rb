# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Onboardings', type: :request do
  describe 'GET /onboardings/new' do
    context 'when unauthenticated' do
      it 'redirects to login' do
        get new_onboarding_path

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when authenticated as candidate' do
      let(:user) { create(:user) }

      before { sign_in user }

      it 'creates a candidate profile' do
        expect do
          get new_onboarding_path
        end.to change(CandidateProfile, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST /onboardings' do
    let(:user) { create(:user) }
    let(:file) do
      fixture_file_upload(
        Rails.root.join('spec/fixtures/files/sample_cv.pdf'),
        'application/pdf'
      )
    end

    before { sign_in user }

    it 'uploads the CV' do
      expect do
        post onboarding_path,
             params: { cv: file }
      end.to change(CandidateDocument, :count).by(1)

      expect(response).to redirect_to(edit_onboarding_path)
    end
  end
end
