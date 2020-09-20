# frozen_string_literal: true

FactoryBot.define do
  factory :sub_category do
    category

    name { 'Matemática' }
  end
end
