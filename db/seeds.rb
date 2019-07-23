# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Test.destroy_all
User.destroy_all
Result.destroy_all
Question.destroy_all
Answer.destroy_all


users = User.create!([
  { name: 'vtka'},
  { name: 'tpepost'},
  { name: 'smartblog'}
])

categories = Category.create!([
  { title: 'back-end' },
  { title: 'front-end' },
  { title: 'machine learning' },
])

tests = Test.create!([
    { level: 2, title: 'Ruby', category_id: categories[0].id },
    { level: 3, title: 'Javascript', category_id: categories[1].id },
    { level: 1, title: 'Python', category_id: categories[2].id }
])

Result.create!([
  { status: true, user_id: users[0].id, test_id: tests[0].id },
  { status: true, user_id: users[1].id, test_id: tests[1].id },
  { status: true, user_id: users[2].id, test_id: tests[2].id }
])

questions = Question.create!([
  { body: 'Ruby: Question 1', test_id: tests[0].id },
  { body: 'Javascript: Question 2', test_id: tests[1].id },
  { body: 'Python: Question 3', test_id: tests[2].id }
])

Answer.create!([
  { body: 'Ruby: Answer 1', question_id: questions[0].id },
  { body: 'Javascript: Answer 2', question_id: questions[1].id },
  { body: 'Python: Answer 3', question_id: questions[2].id }
])
