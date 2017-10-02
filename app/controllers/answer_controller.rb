class AnswerController < ApplicationController
  def create
    @answer = current_quiz.answers.create(question_id: question, choice_id: choice)
    redirect_to question_quiz_path(current_quiz)
  end

  def results
    @collection = AnswerService.call(Quiz.finished)
  end

  private

  def question
    @question ||= params[:question]
  end

  def choice
    @choice ||= params[:choice]
  end
end
