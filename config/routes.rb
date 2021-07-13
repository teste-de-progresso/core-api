# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphqlPlayground::Rails::Engine, at: "/graphql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  post "/uploads", to: "uploads#create"
  post "/update_avatar", to: "users#update_avatar"
end
