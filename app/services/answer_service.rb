class AnswerService
  def self.call(collection)
    new(collection).call
  end

  def call
    only_finished
  end

  private

  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def questions_choices_count
    Answer
      .select("question_id, choice_id, count(choice_id) as count")
      .group('question_id, choice_id')
      .order('question_id')
  end

  def only_finished
    questions_choices_count.where(quiz: ids)
  end

  def ids
    collection.map(&:id)
  end
end
