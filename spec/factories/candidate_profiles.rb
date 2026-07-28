# frozen_string_literal: true

FactoryBot.define do
  factory :candidate_profile do
    association :user
  end
end
