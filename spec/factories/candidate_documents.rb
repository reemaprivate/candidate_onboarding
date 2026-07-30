# frozen_string_literal: true

FactoryBot.define do
  factory :candidate_document do
    association :candidate_profile

    document_type { :cv }
    parsing_status { :pending }

    after(:build) do |document|
      document.file.attach(
        io: Rails.root.join('spec/fixtures/files/sample_cv.pdf').open,
        filename: 'sample_cv.pdf',
        content_type: 'application/pdf'
      )
    end
  end
end
