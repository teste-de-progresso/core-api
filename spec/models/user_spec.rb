# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:roles) }
    it { should have_many(:objectives) }
  end
end
