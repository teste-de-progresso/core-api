# frozen_string_literal: true
module Firebase
  class OauthIntrospectCache
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def exist?
      Rails.cache.exist?(cache_key)
    end

    def save(value)
      Rails.cache.write(cache_key, value, expires_in: 5.minutes)
    end

    def retrieve
      Rails.cache.fetch(cache_key)
    end

    private

    def cache_key
      "firebase:oauth:#{@token}"
    end
  end
end
