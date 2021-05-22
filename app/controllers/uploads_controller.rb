# frozen_string_literal: true
class UploadsController < ApplicationController
  def create
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
end
