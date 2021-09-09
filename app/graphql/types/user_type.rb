# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    graphql_name "User"

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false

    field :inactive_review_requests, Types::ReviewRequest.connection_type, null: false
    def inactive_review_requests
      object.review_requests.inactive
    end

    field :active_review_requests, Types::ReviewRequest.connection_type, null: false
    def active_review_requests
      object.review_requests.active
    end

    field :roles, [UserRoleEnum], null: false
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
