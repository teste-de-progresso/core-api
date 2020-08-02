# frozen_string_literal: true

class Upload < ApplicationRecord
  has_one_attached :file

  before_save :set_filename

  private

  def set_filename
    self.filename = file.filename
  end
end
