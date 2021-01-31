# frozen_string_literal: true

# == Schema Information
#
# Table name: uploads
#
#  id         :bigint           not null, primary key
#  filename   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Upload < ApplicationRecord
  has_one_attached :file
end
