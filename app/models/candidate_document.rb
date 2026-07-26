# frozen_string_literal: true

class CandidateDocument < ApplicationRecord
  belongs_to :candidate_profile

  has_one_attached :file

  validates :file,
            attached: true,
            content_type: %w[
              application/pdf
              application/msword
              application/vnd.openxmlformats-officedocument.wordprocessingml.document
            ],
            size: { less_than: 25.megabytes }
  validates :parsing_status, presence: true

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
         cv: 'cv'
       },
       default: :cv
end
