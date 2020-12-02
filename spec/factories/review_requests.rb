# frozen_string_literal: true

FactoryBot.define do
  factory :review_request do
    question
    user
    canceled_at { '2020-10-10 23:33:56' }
  end
end
