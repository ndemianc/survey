class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.boolean :is_active

      t.timestamps
    end
  end
end
