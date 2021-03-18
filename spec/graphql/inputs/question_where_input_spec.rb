# frozen_string_literal: true

require 'rails_helper'

describe Inputs::QuestionWhereInput do
  subject { described_class }

  describe 'arguments' do
    it { is_expected.to(accept_argument(:check_type).of_type('[Check!]')) }
    it { is_expected.to(accept_argument(:status).of_type('[Status!]')) }
    it { is_expected.to(accept_argument(:difficulty).of_type('[Difficulty!]')) }
    it { is_expected.to(accept_argument(:bloom_taxonomy).of_type('[BloomTaxonomy!]')) }
    it { is_expected.to(accept_argument(:authorship_year).of_type('[String!]')) }
    it { is_expected.to(accept_argument(:user_id).of_type('ID')) }
  end
end
