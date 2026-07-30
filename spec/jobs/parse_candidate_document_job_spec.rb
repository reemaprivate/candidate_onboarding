# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParseCandidateDocumentJob, type: :job do
  subject(:perform_job) { described_class.perform_now(document) }

  let(:document) { create(:candidate_document) }

  it 'calls the parser service' do
    allow(CandidateDocuments::Parser)
      .to receive(:call)

    described_class.perform_now(document)

    expect(CandidateDocuments::Parser)
      .to have_received(:call)
            .with(document: document)
  end
end
