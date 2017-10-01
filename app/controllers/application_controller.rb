class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def check_existing_quiz!
    redirect_to new_quiz_path, :notice => 'Starting new quiz' unless current_quiz.present?
  end

  private

  def current_quiz
    @current_quiz ||= session[:current_quiz] && Quiz.find_by(id: session[:current_quiz])
  end
end
