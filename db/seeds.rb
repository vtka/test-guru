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
  { email: 'vtka@gmail.com'},
  { email: 'tpepost@gmail.com'},
  { email: 'smartblog@gmail.com'}
])

categories = Category.create!([
  { title: 'back-end' },
  { title: 'front-end' },
  { title: 'machine learning' }
])

tests = Test.create!([
    { level: 2, title: 'Ruby', category: categories[0], author: users[0] },
    { level: 3, title: 'Javascript', category: categories[1], author: users[1] },
    { level: 7, title: 'Python', category: categories[2], author: users[0] }
])

# Result.create!([
#   { status: true, user_id: users[0], test_id: tests[0] },
#   { status: true, user_id: users[1], test_id: tests[1] },
#   { status: true, user_id: users[2], test_id: tests[2] }
# ])

questions = Question.create!([
  { body: 'Ruby: Question 1', test: tests[0] },
  { body: 'Javascript: Question 2', test: tests[1] },
  { body: 'Python: Question 3', test: tests[2] }
])

Answer.create!([
  { body: 'Ruby: Answer 1', correct: false, question: questions[0] },
  { body: 'Javascript: Answer 2', question: questions[1] },
  { body: 'Python: Answer 3', question: questions[2] }
])
