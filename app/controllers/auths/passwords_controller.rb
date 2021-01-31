# frozen_string_literal: true

module Auths
  class PasswordsController < Devise::PasswordsController
    respond_to :json

    def create
      self.resource = resource_class.send_reset_password_instructions(resource_params)

      yield resource if block_given?

      if successfully_sent?(resource)
        respond_with({}, status: :ok, location: after_sending_reset_password_instructions_path_for(resource_name))
      else
        respond_with(resource, status: :not_acceptable)
      end
    end
  end
end
