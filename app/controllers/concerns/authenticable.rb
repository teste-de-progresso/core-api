# frozen_string_literal: true

module Authenticable
  extend ActiveSupport::Concern

  included do
    def current_user
      return User.new if auth_token.nil? && Rails.env.development?

      @current_user ||= User.find_by(email: user_email)
    end

    private

    def user_email
      Firebase::OauthIntrospect.new(auth_token).user_email
    end

    def auth_token
      request.headers["Authorization"]&.gsub(/^Bearer /, "")
    end
  end
end
