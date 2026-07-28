# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CandidateDocuments::Uploader do
  describe '.call' do
    subject(:upload_document) do
      described_class.call(
        profile:,
        file:
      )
    end

    let(:profile) { create(:candidate_profile) }

    let(:file) do
      fixture_file_upload(
        Rails.root.join('spec/fixtures/files/sample_cv.pdf'),
        'application/pdf'
      )
    end

    it 'creates a candidate document' do
      expect { upload_document }
        .to change(CandidateDocument, :count)
        .by(1)
    end

    it 'attaches the uploaded file' do
      expect(upload_document.file).to be_attached
    end

    it 'marks the document as pending' do
      expect(upload_document.parsing_status).to eq('pending')
    end

    it 'stores the document as a CV' do
      expect(upload_document.document_type).to eq('cv')
    end
  end
end
