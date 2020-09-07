# frozen_string_literal: true

module Types
  module Users
    class Details < Types::BaseObject
      field :name, String, null: true
      field :avatar_url, String, null: true

      def avatar_url
        Rails.application.routes.url_helpers.rails_blob_url(object.avatar, only_path: true)
      end
    end
  end
end
