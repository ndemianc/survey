class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def check_existing_quiz!
    redirect_to question_quiz_path(current_quiz) if current_quiz.present?
  end

  def check_finished_quiz!
    redirect_to results_answer_index_path if quiz_finished?
    redirect_to new_quiz_path unless current_quiz.present?
  end

  private

  def current_quiz
    @current_quiz ||= session[:current_quiz] && Quiz.find_by(id: session[:current_quiz])
  end

  def quiz_finished?
    current_quiz.present? && !current_quiz.is_active
  end
end
