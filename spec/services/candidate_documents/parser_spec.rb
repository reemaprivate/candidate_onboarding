# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CandidateDocuments::Parser do
  describe '.call' do
    subject(:parse_document) { described_class.call(document: document) }

    let(:document) { create(:candidate_document, parsing_status: :pending) }

    it 'marks the document as completed' do
      parse_document

      expect(document.reload).to be_completed
    end
  end
end
