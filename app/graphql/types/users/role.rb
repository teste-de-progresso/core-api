# frozen_string_literal: true

module Types
  module Users
    class Role < Types::BaseEnum
      value 'admin'
      value 'teacher'
      value 'nde'
      value 'coordinator'
      value 'center_director'
      value 'pro_rector'
    end
  end
end
