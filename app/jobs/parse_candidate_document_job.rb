# frozen_string_literal: true

class ParseCandidateDocumentJob < ApplicationJob
  queue_as :default

  def perform(document)
    CandidateDocuments::Parser.call(document:)
  end
end
