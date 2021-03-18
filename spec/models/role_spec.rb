# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe(Role, type: :model) do
  describe 'associations' do
    it { is_expected.to(have_and_belong_to_many(:users)) }
  end

  describe 'validations' do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_uniqueness_of(:name)) }
  end
end
