ActiveRecord::Base.transaction do
  User.create(first_name: 'khondakar',
              last_name: 'fahad',
              email: 'khondakarfahad@gmail.com',
              phone_number: '+8801682278264',
              role: 1,
              password: '1234')
  course = Course.create!(name: 'Programing')
  lesson = Lesson.create!(name: 'API', course_id: course.id)
  Question.create!(lesson_id: lesson.id,
                   name: 'How many http verbs are exists on REST API?',
                   options: '4, 5, 6, 3',
                   answer: '3')

end
