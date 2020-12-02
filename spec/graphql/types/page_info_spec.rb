# frozen_string_literal: true

require 'rails_helper'

describe Types::PageInfo do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:count).of_type 'Int!' }
    it { is_expected.to have_field(:limit_value).of_type 'Int!' }
    it { is_expected.to have_field(:total_pages).of_type 'Int!' }
    it { is_expected.to have_field(:current_page).of_type 'Int' }
    it { is_expected.to have_field(:next_page).of_type 'Int' }
    it { is_expected.to have_field(:prev_page).of_type 'Int' }
    it { is_expected.to have_field(:first_page).of_type 'Boolean!' }
    it { is_expected.to have_field(:last_page).of_type 'Boolean!' }
    it { is_expected.to have_field(:out_of_range).of_type 'Boolean!' }
  end
end
