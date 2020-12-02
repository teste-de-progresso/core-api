# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_many :questions, dependent: :destroy
  has_many :review_requests, dependent: :destroy
  has_and_belongs_to_many :roles
  has_one_base64_attached :avatar

  sig { returns(ActiveModel::Type::Boolean) }
  def admin?
    role?(:admin)
  end

  sig { returns(ActiveModel::Type::Boolean) }
  def teacher?
    role?(:teacher)
  end

  sig { returns(ActiveModel::Type::Boolean) }
  def nde?
    role?(:nde)
  end

  sig { returns(ActiveModel::Type::Boolean) }
  def coordinator?
    role?(:coordinator)
  end

  sig { returns(ActiveModel::Type::Boolean) }
  def center_director?
    role?(:center_director)
  end

  sig { returns(ActiveModel::Type::Boolean) }
  def pro_rector?
    role?(:pro_rector)
  end

  sig { params(role: Symbol).returns(ActiveModel::Type::Boolean) }
  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  sig do
    returns({
              user_id: Integer,
              name: String,
              email: String,
              roles: [String]
            })
  end
  def jwt_payload
    {
      user_id: id,
      name: name,
      email: email,
      roles: roles.map { |r| r.name.underscore }
    }
  end

  sig { returns(ActiveRecord::Relation) }
  def active_review_requests
    review_requests.where(answered: false)
  end

  sig { returns(String) }
  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(avatar, only_path: true)
  rescue NoMethodError
    nil
  end
end
