# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_many :objectives, dependent: :destroy # Depreciated due to questions
  has_many :questions, dependent: :destroy
  has_many :review_requests, dependent: :destroy
  has_and_belongs_to_many :roles
  has_one_base64_attached :avatar

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

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
