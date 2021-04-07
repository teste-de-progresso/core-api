# frozen_string_literal: true

class ReviewerMailer < ApplicationMailer
  default from: "testeprogresso@unifeso.edu.br"

  def question_deleted_notification
    @question_id = params[:question_id]
    mail(to: params[:recipient].email, subject: "Uma questão foi excluída")
  end
end
