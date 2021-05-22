# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphqlPlayground::Rails::Engine, at: "/playground", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  post "/uploads", to: "uploads#create"
  post "/update_avatar", to: "users#update_avatar"

  devise_for :users,
    path: "",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      registration: "signup",
    },
    controllers: {
      sessions: "auths/sessions",
      registrations: "auths/registrations",
      passwords: "auths/passwords",
    }
end
