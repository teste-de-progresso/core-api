# frozen_string_literal: true

# == Schema Information
#
# Table name: axes
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_axes_on_name  (name) UNIQUE
#
class Axis < ApplicationRecord
  has_many :subjects, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
