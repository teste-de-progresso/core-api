# typed: ignore
# frozen_string_literal: true

namespace :prod do
  desc 'Create role'
  task roles: :environment do
    roles = %i[
      admin
      teacher
      nde
      coordinator
      center_director
      pro_rector
    ]

    spinner = TTY::Spinner.new(':spinner Creating user for each role', format: :bouncing_ball)
    spinner.auto_spin

    roles.each do |role|
      Role.create(name: role)
    end

    spinner.success('(successful)')
  end
end
