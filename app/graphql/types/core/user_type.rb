# frozen_string_literal: true

module Types
  module Core
    class UserType < Types::BaseObject
      graphql_name 'User'

      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :inactive_review_requests, Types::Review::Request.connection_type, null: false
      field :active_review_requests, Types::Review::Request.connection_type, null: false

      field :roles, [UserRoles], null: false

      def roles
        object.roles.map(&:name)
      end

      field :avatar_url, String, null: true

      def avatar_url
        Rails.application.routes.url_helpers.rails_blob_url(object.avatar, only_path: true)
      rescue NoMethodError
        nil
      end
    end
  end
end
