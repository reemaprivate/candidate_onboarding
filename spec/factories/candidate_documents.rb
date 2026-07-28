# frozen_string_literal: true

FactoryBot.define do
  factory :candidate_document do
    association :candidate_profile

    document_type { :cv }
    parsing_status { :pending }
  end
end
