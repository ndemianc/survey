# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
Choice.destroy_all

data_file = Rails.root.join('db', 'data.json')
collection = JSON.parse(File.read(data_file))['questions']

collection.each do |item|
  question = Question.create!(question: item['question'])
  item['choices'].each do |choice|
    question.choices.create!(choice: choice)
  end
end

p "Created #{Question.count} questions"
p "Created #{Choice.count} choices"
