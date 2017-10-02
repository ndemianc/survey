class CountChoicesService
  def self.call(question_id)
    new(question_id).call
  end

  def call
    only_finished.to_a
  end

  private

  attr_reader :question_id

  def initialize(question_id)
    @question_id = question_id
  end

  def count_choices_by_question
    Answer
      .select("COUNT(choice_id), choice_id")
      .where(question_id: question_id)
      .group(:choice_id)
      .order(:choice_id)
  end

  def only_finished
    count_choices_by_question.where(answers: { quiz_id: quiz_ids })
  end

  def finished_quizzes
    Quiz.finished
  end

  def quiz_ids
    @quiz_ids = finished_quizzes.map(&:id)
  end
end
