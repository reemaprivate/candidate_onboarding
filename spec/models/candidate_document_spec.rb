# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CandidateDocument, type: :model do
  describe 'defaults' do
    it 'defaults to pending' do
      document = described_class.new

      expect(document.parsing_status).to eq('pending')
    end
  end
end
