class NextQuestionService
  def self.next(quiz)
    new(quiz).next
  end

  def next
    available_questions.first
  end

  private

  attr_reader :quiz

  def initialize(quiz)
    @quiz = quiz
  end

  def available_questions
    Question.where("NOT EXISTS (
      SELECT 1 FROM answers
      WHERE answers.quiz_id = (?)
      AND answers.question_id = questions.id
    )", quiz_id)
  end

  def quiz_id
    @quiz_id ||= quiz.try(:id)
  end
end
