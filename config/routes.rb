# frozen_string_literal: true

Rails.application.routes.draw do
  post "/picture/upload", to: "assets#upload" # DEPRECATED
  post "/upload", to: "assets#upload"
  post "/update_user_avatar", to: "assets#update_user_avatar"

  post "/", to: "graphql#execute"

  mount GraphqlPlayground::Rails::Engine, at: "/playground", graphql_path: "/" if Rails.env.development?

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
