# frozen_string_literal: true

class CandidateDocument < ApplicationRecord
  MAX_FILE_SIZE = 25.megabytes
  belongs_to :candidate_profile

  has_one_attached :file

  validates :file,
            attached: true,
            content_type: %w[
              application/pdf
              application/msword
              application/vnd.openxmlformats-officedocument.wordprocessingml.document
            ],
            size: { less_than: MAX_FILE_SIZE }
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
