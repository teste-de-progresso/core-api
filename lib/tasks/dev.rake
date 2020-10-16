# frozen_string_literal: true

namespace :dev do
  desc 'Create user for each role'
  task users: :environment do
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
      user = User.create(email: "#{role}@example.com", password: 'password')
      role = Role.create(name: role)

      user.roles << role
    end

    spinner.success('(successful)')
  end

  desc 'Create 50 draft question for teacher@example.com'
  task questions: :environment do
    spinner = TTY::Spinner.new(':spinner Creating 50 draft questions for teacher@example.com', format: :bouncing_ball)
    spinner.auto_spin

    teacher = User.find_by(email: 'teacher@example.com')

    50.times do |_i|
      Objective.create(
        user_id: teacher.id,
        status: 'draft',
        difficulty: 'easy',
        bloom_taxonomy: 'remember',
        check_type: 'incomplete_affirmation'
      )
    end

    spinner.success('(successful)')
  end

  desc 'Subject > Axis > Category > SubCategory'
  task categories: :environment do
    spinner = TTY::Spinner.new(':spinner Creating Subject > Axis > Category > SubCategory', format: :bouncing_ball)
    spinner.auto_spin

    subject = Subject.create(
      name: 'Cálculo'
    )

    axis = Axis.create(
      name: 'Algoritmos de Alto Desempenho',
      subject_id: subject.id
    )

    category = Category.create(
      name: 'Conhecimentos Básicos',
      axis_id: axis.id
    )

    SubCategory.create(
      name: 'Matemática',
      category_id: category.id
    )

    spinner.success('(successful)')
  end

  desc 'Reset database and run seeds'
  task setup: :environment do
    spinner = TTY::Spinner.new(':spinner Dropping database', format: :bouncing_ball)
    spinner.auto_spin
    `rails db:drop`
    spinner.success('(successful)')

    spinner = TTY::Spinner.new(':spinner Creating database', format: :bouncing_ball)
    spinner.auto_spin
    `rails db:create`
    spinner.success('(successful)')

    spinner = TTY::Spinner.new(':spinner Running database migrations', format: :bouncing_ball)
    spinner.auto_spin
    `rails db:migrate`
    spinner.success('(successful)')

    `rails dev:users`
    `rails dev:questions`
    `rails dev:categories`
  end
end
