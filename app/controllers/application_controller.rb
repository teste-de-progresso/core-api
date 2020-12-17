# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def current_user
    token = request.headers['Authorization']
    find_or_initilize_user(token)
  end

  def find_or_initilize_user(token)
    if token.nil?
      User.new
    else
      user_email = firebase_verification(token)
      User.find_by(email: user_email) || User.new
    end
  end

  def firebase_verification(token)
    url = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=#{ENV['FIREBASE_API_KEY']}"
    firebase_verification_call = HTTParty.post(url, headers: { 'Content-Type' => 'application/json' }, body: { 'idToken' => token }.to_json)

    return unless firebase_verification_call.response.code == '200'

    firebase_verification_call['users'].first['email']
  end
end
