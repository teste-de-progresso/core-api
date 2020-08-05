# frozen_string_literal: true

class PictureController < ApplicationController
  def upload
    @upload = Upload.new(
      file: params[:upload],
      filename: params[:upload].original_filename
    )

    if @upload.save!
      render json: {
        uploaded: true,
        fileName: @upload.filename,
        url: url
      }.to_json
    else
      render json: {
        uploaded: false
      }
    end
  end

  private

  def url
    ENV['HOSTNAME'] + rails_blob_path(@upload.file)
  end
end
