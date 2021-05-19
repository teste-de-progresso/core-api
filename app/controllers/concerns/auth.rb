# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern

  included do
    def current_user
      return User.new if auth_token.nil? && Rails.env.development?

      User.find(jwt_user_id)
    end

    private

    def auth_token
      request.headers["Authorization"]&.gsub(/^Bearer /, "")
    end

    def jwt_user_id
      secret = Rails.env.production? ? ENV["DEVISE_JWT_SECRET_KEY"] : "1cb26f40-498b-4f72-a00a-e8633abc5957"
      JWT.decode(auth_token, secret, true, algorithm: "HS256", verify_jti: true).first["sub"]
    end
  end
end
