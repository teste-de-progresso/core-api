# frozen_string_literal: true

roles = %i[
  teacher
  nde
  coordinator
  center_director
  pro_rector
]

roles.each do |role|
  user = User.create(email: "#{role}@example.com", password: 'password')
  role = Role.create(name: role)

  user.roles << role
end
