# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_many :questions, dependent: :destroy
  has_many :review_requests, dependent: :destroy
  has_and_belongs_to_many :roles
  has_one_base64_attached :avatar

  validates :name, presence: true

  def jwt_payload
    {
      user_id: id,
      name: name,
      email: email,
      roles: roles.map { |r| r.name.underscore }
    }
  end

  def active_review_requests
    review_requests.where(answered: false)
  end

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(avatar, only_path: true)
  rescue NoMethodError
    nil
  end
end
