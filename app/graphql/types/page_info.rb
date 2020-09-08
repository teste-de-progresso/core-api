# frozen_string_literal: true

module Types
  class PageInfo < Types::BaseObject
    graphql_name 'PageInfoType'

    field :count, Integer, null: false
    field :limit_value, Integer, null: false
    field :total_pages, Integer, null: false
    field :current_page, Integer, null: true
    field :next_page, Integer, null: true
    field :prev_page, Integer, null: true
    field :first_page, Boolean, null: false
    field :last_page, Boolean, null: false
    field :out_of_range, Boolean, null: false

    def first_page
      object.first_page?
    end

    def last_page
      object.last_page?
    end

    def out_of_range
      object.out_of_range?
    end
  end
end
