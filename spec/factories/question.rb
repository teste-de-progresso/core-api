# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    id { 104 }
    introduction { 'question title' }
    instruction { 'html raw' }
    support { 'html raw' }
    body { 'html raw' }
    alternatives do
      [{ text: 'html raw', correct: true },
       { text: 'html raw', correct: false },
       { text: 'html raw', correct: false },
       { text: 'html raw', correct: false },
       { text: 'html raw', correct: false }]
    end
    explanation { 'html raw' }
    references { 'html raw' }
    status { 'finished' }
    difficulty { 'easy' }
    check_type { 'unique_answer' }
    bloom_taxonomy { 'understand' }
    authorship_year { '2020' }
    source { 'UNIFESO' }
    user
    subject
  end
end
