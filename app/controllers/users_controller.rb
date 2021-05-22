# frozen_string_literal: true

class UsersController < ApplicationController
  def update_avatar
    if current_user.avatar.attach({ data: params[:upload] })
      render(json: { updated: true })
    else
      render(json: { updated: false })
    end
  end
end
