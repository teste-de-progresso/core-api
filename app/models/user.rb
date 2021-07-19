# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           default(""), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  has_many :questions, dependent: :destroy
  has_many :review_requests, dependent: :destroy
  has_and_belongs_to_many :roles, -> { distinct }
  has_one_base64_attached :avatar

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
