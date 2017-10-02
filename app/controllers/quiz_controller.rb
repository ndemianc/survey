class QuizController < ApplicationController
  before_action :check_existing_quiz!, only: [:new, :create]
  before_action :check_finished_quiz!, only: [:question]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(is_active: true)
    session[:current_quiz] = @quiz.id
    redirect_to question_quiz_path(@quiz)
  end

  def question
    @question = NextQuestionService.next(current_quiz)
    if @question
      @answer = Answer.new
    else
      current_quiz.update_attribute(:is_active, false)
      redirect_to results_answer_index_path
    end
  end
end
