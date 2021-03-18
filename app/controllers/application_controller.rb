# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_resource(resource)
    if resource.errors.empty?
      render(json: resource)
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render(json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100',
        },
      ],
    }, status: :bad_request)
  end

  def current_user
    token = request.headers['Authorization']&.gsub(/^Bearer /, '')
    secret = Rails.env.production? ? ENV['DEVISE_JWT_SECRET_KEY'] : '1cb26f40-498b-4f72-a00a-e8633abc5957'
    user_id = JWT.decode(token, secret, true, algorithm: 'HS256', verify_jti: true).first['user_id']
    User.find_by(id: user_id)
  rescue JWT::DecodeError
    User.new
  end
end
