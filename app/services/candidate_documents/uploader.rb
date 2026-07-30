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
      document = @profile.candidate_documents.build(
        document_type: :cv,
        parsing_status: :pending,
      )

      if @file.present?
        document.file.attach(@file)
        document.original_filename = @file.original_filename
        document.content_type = @file.content_type
        document.file_size = @file.size
      end

      document.save!

      document
    end
  end
end
