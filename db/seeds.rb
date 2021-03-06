# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Difficulty.delete_all
Question.delete_all
Choice.delete_all
QuestionInstance.delete_all
UserResponse.delete_all
User.delete_all

Difficulty.create!(:id => 1, :points => 500)
Difficulty.create!(:id => 2, :points => 1000)
Difficulty.create!(:id => 3, :points => 2500)
Difficulty.create!(:id => 4, :points => 5000)

User.create!(:id => 1, :username => 'admin', :password => 'password', :password_confirmation => 'password', :email => 'admin@gmail.com', :avatar => '', :role => 'admin')
User.create!(:id => 2, :username => 'test', :password => 'password', :password_confirmation => 'password', :email => 'test@gmail.com', :avatar => '', :role => 'user')

File.open("seed_data/questions.txt") do |questions|
    id_count = 0
    questions.read.each_line do |q|
        id_count += 1
        question_type, question, attempts, difficulty = q.chomp.split("|")
        Question.create!(:id => id_count, :question_type => question_type, :question => question, :attempts => attempts, :difficulty => Difficulty.find_by_id(difficulty))
  end
end

File.open("seed_data/choices.txt") do |choices|
    choices.read.each_line do |c|
        choice, correct_choice, question = c.chomp.split("|")
        Choice.create!(:choice => choice, :correct_choice => correct_choice, :question => Question.find_by_id(question))
  end
end

#Sets the next id in the sequence to the maximum id in the table
connection = ActiveRecord::Base.connection
connection.execute("SELECT setval('difficulties_id_seq', max(id)) FROM difficulties")
connection.execute("SELECT setval('users_id_seq', max(id)) FROM users")
connection.execute("SELECT setval('questions_id_seq', max(id)) FROM questions")
connection.execute("SELECT setval('choices_id_seq', max(id)) FROM choices")
