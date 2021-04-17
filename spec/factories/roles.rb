# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :role do
    trait :admin do
      name { "admin" }
    end
    trait :teacher do
      name { "teacher" }
    end
    trait :nde do
      name { "nde" }
    end
    trait :coordinator do
      name { "coordinator" }
    end
    trait :center_director do
      name { "center_director" }
    end
    trait :pro_rector do
      name { "pro_rector" }
    end
  end
end
