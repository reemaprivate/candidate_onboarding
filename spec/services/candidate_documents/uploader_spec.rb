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

    it 'stores document metadata' do
      expect(upload_document.document_type).to eq('cv')
      expect(upload_document.original_filename).to eq('sample_cv.pdf')
      expect(upload_document.content_type).to eq('application/pdf')
      expect(upload_document.file_size).to be_positive
      expect(upload_document.candidate_profile).to eq(profile)
    end
  end
end
