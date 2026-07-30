# frozen_string_literal: true

module CandidateDocuments
  class Parser
    def self.call(...)
      new(...).call
    end

    def initialize(document:)
      @document = document
    end

    def call
      @document.processing!

      # TODO: actual CV parsing will be implemented later

      @document.completed!
    rescue StandardError
      @document.failed!
      raise
    end
  end
end
