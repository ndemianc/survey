class AnswerController < ApplicationController
  def create
    @answer = current_quiz.answers.create(question_id: question, choice_id: choice)
    redirect_to question_quiz_path(current_quiz)
  end

  def results
    @choices = choices_hash
    @results = questions.map do |question|
      {
        question.question => CountChoicesService.call(question.id)
      }
    end
  end

  private

  def question
    @question ||= params[:question]
  end

  def choice
    @choice ||= params[:choice]
  end

  def choices
    @choices ||= Array.wrap(Choice.all)
  end

  def choices_hash
    choices_hash = {}
    choices.each { |choice| choices_hash[choice.id] = choice.choice }
    choices_hash
  end

  def questions
    @questions ||= Array.wrap(Question.all)
  end
end
