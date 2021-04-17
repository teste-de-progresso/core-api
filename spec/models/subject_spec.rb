# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  axis_id     :bigint
#  category_id :bigint
#
# Indexes
#
#  index_subjects_on_axis_id      (axis_id)
#  index_subjects_on_category_id  (category_id)
#  index_subjects_on_name         (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (axis_id => axes.id)
#  fk_rails_...  (category_id => categories.id)
#
require "rails_helper"

RSpec.describe(Subject, type: :model) do
  describe "associations" do
    it { is_expected.to(belong_to(:axis)) }
    it { is_expected.to(belong_to(:category)) }
    it { is_expected.to(have_many(:questions)) }
  end

  describe "validations" do
    subject { create :subject }

    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_uniqueness_of(:name)) }
  end
end
