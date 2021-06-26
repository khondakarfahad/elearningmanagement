class ExamsController < ApplicationController
  def index
    @course = Course.all
    @lessons = Lesson.all
    @questions = Question.all
  end
end