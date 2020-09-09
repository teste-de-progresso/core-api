# frozen_string_literal: true

class AssetsController < ApplicationController
  def upload
    @upload = Upload.new(
      file: params[:upload],
      user_id: current_user.id
    )

    if @upload.save!
      render json: {
        uploaded: true,
        url: rails_blob_url(@upload.file, only_path: false)
      }.to_json
    else
      render json: { uploaded: false }
    end
  end

  def update_user_avatar
    if current_user.update(avatar: params[:upload])
      render json: { updated: true }
    else
      render json: { updated: false }
    end
  end
end
