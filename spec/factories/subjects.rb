# frozen_string_literal: true

FactoryBot.define do
  factory :subject do
    axis
    category
    name { 'Cálculo' }
  end
end
