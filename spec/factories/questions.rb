# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id                 :bigint           not null, primary key
#  alternatives       :jsonb            not null
#  authorship_year    :string
#  bloom_taxonomy     :string
#  body               :text
#  check_type         :string
#  difficulty         :string
#  explanation        :text
#  instruction        :text
#  intention          :string
#  references         :text
#  source             :string
#  status             :string           default("draft"), not null
#  support            :text
#  targeted_knowledge :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  subject_id         :bigint
#  user_id            :bigint
#
# Indexes
#
#  index_questions_on_subject_id  (subject_id)
#  index_questions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
FactoryBot.define do
  factory :question do
    introduction { "question title" }
    instruction { "html raw" }
    support { "html raw" }
    body { "html raw" }
    alternatives do
      [{ text: "html raw", correct: true },
       { text: "html raw", correct: false },
       { text: "html raw", correct: false },
       { text: "html raw", correct: false },
       { text: "html raw", correct: false }]
    end
    explanation { "html raw" }
    references { "html raw" }
    status { "finished" }
    difficulty { "easy" }
    check_type { "unique_answer" }
    bloom_taxonomy { "understand" }
    authorship_year { "2020" }
    source { "UNIFESO" }
    user
    subject
  end
end
