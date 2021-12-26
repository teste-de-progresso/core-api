# frozen_string_literal: true
module Firebase
  class OauthIntrospect
    attr_reader :token, :cache

    def initialize(token)
      @token = token
      @cache = OauthIntrospectCache.new(token)
    end

    def user_email
      return @cache.retrieve if @cache.exist?

      email = request&.dig("users")&.first&.dig("email")

      @cache.save(email) && email
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
      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=#{api_key}"
    end

    def api_key
      ENV["FIREBASE_API_KEY"]
    end
  end
end
