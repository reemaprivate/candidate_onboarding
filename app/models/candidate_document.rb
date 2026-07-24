# frozen_string_literal: true

class CandidateDocument < ApplicationRecord
  belongs_to :candidate_profile

  enum :parsing_status,
       {
         pending: 'pending',
         processing: 'processing',
         completed: 'completed',
         failed: 'failed'
       },
       default: :pending

  enum :document_type,
       {
         cv: "cv"
       },
       default: :cv
end
