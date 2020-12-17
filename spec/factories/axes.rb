# frozen_string_literal: true

FactoryBot.define do
  factory :axis do
    name { Faker::Superhero.name }
  end
end
