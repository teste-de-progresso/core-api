# frozen_string_literal: true

module Types
  class UserRoleEnum < Types::BaseEnum
    graphql_name "UserRole"

    value "admin"
    value "teacher"
    value "nde"
    value "coordinator"
    value "center_director"
    value "pro_rector"
  end
end
