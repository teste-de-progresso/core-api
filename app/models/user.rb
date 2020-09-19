# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_one_base64_attached :avatar
  has_many :objectives, dependent: :destroy
  has_and_belongs_to_many :roles

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  def jwt_payload
    { user_id: id, email: email }
  end
end
