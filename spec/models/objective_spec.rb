# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Objective, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:subject).optional } 
    it { is_expected.to have_many(:review_requests) } 
  end


  describe '#reviewer' do
    context '' do
      it '' do
        user = User.create()
        objective = create(:objective)


        expect(objective.reviewer).to eq ''  
      end
    end
  end
end
