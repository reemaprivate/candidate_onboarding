# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Onboarding::Initializer do
  describe '.call' do
    subject(:call_initializer) { described_class.call(user:) }

    context 'when candidate has no profile' do
      let(:user) { create(:user, role: :candidate) }

      it 'creates a candidate profile' do
        expect { call_initializer }
          .to change(CandidateProfile, :count)
          .by(1)

        expect(call_initializer.user).to eq(user)
      end
    end

    context 'when candidate already has a profile' do
      let(:user) { create(:user) }

      let!(:profile) do
        create(:candidate_profile, user:)
      end

      it 'returns the existing profile' do
        expect(call_initializer).to eq(profile)

        expect(CandidateProfile.count).to eq(1)
      end
    end

    context 'when user is recruiter' do
      let(:user) { create(:user, role: :recruiter) }

      it 'raises an error' do
        expect { call_initializer }
          .to raise_error(
            ArgumentError,
            'Only candidates can access onboardings.'
          )
      end
    end
  end
end
