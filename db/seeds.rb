# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  email: 'admin@example.com',
  password: 'password'
)

10.times do
  Objective.create!(
    body: '<p>questão lalala</p>',
    alternatives:
      [{ 'text' => '<p>alternativa correta</p>', 'correct' => true },
       { 'text' => '', 'correct' => false },
       { 'text' => '', 'correct' => false },
       { 'text' => '', 'correct' => false },
       { 'text' => '', 'correct' => false }],
    status: 'draft',
    user_id: user.id,
    introduction: 'questãolalala',
    explanation: '<p>explicação da alternativa correta</p>',
    difficulty: 'easy',
    bloom_taxonomy: 'remember',
    authorship_year: '2020',
    source: nil,
    own: false
  )
end
