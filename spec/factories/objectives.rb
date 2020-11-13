# frozen_string_literal: true

FactoryBot.define do
  factory :objective do
    review_request
    user
    subject
    status { 'finished' }
    difficulty { 'medium' }
    bloom_taxonomy { 'apply' }
    check_type { 'incomplete_affirmation' }
  end
end
