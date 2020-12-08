# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::Base do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:id).of_type 'ID!' }
    it { is_expected.to have_field(:uuid).of_type 'ID!' }
    it { is_expected.to have_field(:introduction).of_type 'String' }
    it { is_expected.to have_field(:instruction).of_type 'String' }
    it { is_expected.to have_field(:body).of_type 'String' }
    it { is_expected.to have_field(:support).of_type 'String' }
    it { is_expected.to have_field(:alternatives).of_type '[AlternativeType!]' }
    it { is_expected.to have_field(:explanation).of_type 'String' }
    it { is_expected.to have_field(:references).of_type 'String' }
    it { is_expected.to have_field(:status).of_type 'Status' }
    it { is_expected.to have_field(:check_type).of_type 'Check' }
    it { is_expected.to have_field(:difficulty).of_type 'Difficulty' }
    it { is_expected.to have_field(:bloom_taxonomy).of_type 'BloomTaxonomy' }
    it { is_expected.to have_field(:authorship_year).of_type 'String' }
    it { is_expected.to have_field(:source).of_type 'String' }
    it { is_expected.to have_field(:reviewer).of_type 'User' }
    it { is_expected.to have_field(:review_requests).of_type '[ReviewRequestType!]!' }
    it { is_expected.to have_field(:subject).of_type 'Subject' }
    it { is_expected.to have_field(:user_id).of_type 'Int' }
    it { is_expected.to have_field(:created_at).of_type 'ISO8601DateTime!' }
    it { is_expected.to have_field(:updated_at).of_type 'ISO8601DateTime!' }
  end
end
