# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    trait :admin do
      name { 'admin' }
    end
    trait :teacher do
      name { 'teacher' }
    end
    trait :nde do
      name { 'nde' }
    end
    trait :coordinator do
      name { 'coordinator' }
    end
    trait :center_director do
      name { 'center_director' }
    end
    trait :pro_rector do
      name { 'pro_rector' }
    end
  end
end
