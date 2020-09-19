# frozen_string_literal: true

module Types
  module Users
    class Details < Types::BaseObject
      field :name, String, null: true
      field :avatar_url, String, null: true
      field :roles, [Role], null: false

      def avatar_url
        Rails.application.routes.url_helpers.rails_blob_url(object.avatar, only_path: true)
      rescue NoMethodError
        nil
      end

      def roles
        object.roles.map { |r| r.name }
      end
    end
  end
end
