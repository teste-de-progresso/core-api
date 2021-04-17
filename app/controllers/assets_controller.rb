# frozen_string_literal: true

class AssetsController < ApplicationController
  def upload
    @upload = Upload.new(file: params[:upload])

    if @upload.save!
      render(json: {
        uploaded: true,
        url: rails_blob_url(@upload.file, only_path: false),
      }.to_json)
    else
      render(json: { uploaded: false })
    end
  end

  def update_user_avatar
    if current_user.avatar.attach({ data: params[:upload] })
      render(json: { updated: true })
    else
      render(json: { updated: false })
    end
  end
end
