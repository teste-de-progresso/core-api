# frozen_string_literal: true

module Authenticable
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
    end
  end
end
