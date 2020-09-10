# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  def jwt_payload
    {
      user_id: id,
      email: email
    }
  end

  has_one_base64_attached :avatar
  has_many :objectives, dependent: :destroy
end
