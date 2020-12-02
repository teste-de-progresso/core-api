# frozen_string_literal: true

FactoryBot.define do
  factory :review_feedback do
    review_request
    status { 'MyString' }
    comment { 'MyText' }
  end
end
