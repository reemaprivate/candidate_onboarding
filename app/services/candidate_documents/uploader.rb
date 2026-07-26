# frozen_string_literal: true

module CandidateDocuments
  class Uploader
    def self.call(...)
      new(...).call
    end

    def initialize(profile:, file:)
      @profile = profile
      @file = file
    end

    def call
      document = @profile.candidate_documents.new(
        document_type: :cv,
        parsing_status: :pending
      )

      document.file.attach(@file)

      document.save!

      document
    end
  end
end
