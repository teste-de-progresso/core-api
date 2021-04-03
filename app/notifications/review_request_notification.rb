# frozen_string_literal: true

class ReviewRequestNotification < Noticed::Base
  deliver_by :email, mailer: 'UserMailer'

  param :question

  def message
    t('.message', creator_name: question.user.name, question_id: question.id)
  end
end
