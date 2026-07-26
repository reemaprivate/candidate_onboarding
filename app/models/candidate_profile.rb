# frozen_string_literal: true

class CandidateProfile < ApplicationRecord
  belongs_to :user

  has_many :candidate_documents, dependent: :destroy
end
