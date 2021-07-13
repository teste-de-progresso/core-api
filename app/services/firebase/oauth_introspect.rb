# frozen_string_literal: true
module Firebase
  class OauthIntrospect
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def email
      request.dig("users")&.first&.dig("email")
    end

    private

    def request
      HTTParty.post(
        identity_api_endpoint,
        headers: { "Content-Type" => "application/json" },
        body: { "idToken" => token }.to_json
      )
    end

    def identity_api_endpoint
      api_key = ENV["FIREBASE_API_KEY"]

      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=#{api_key}"
    end
  end
end
