class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = 'Lesson created successfully'
      redirect_to lessons_path
    else
      render json: { error: 'Lesson creation error' },
             status: :unprocessable_entity
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = 'Lesson updated successfully'
      redirect_to lessons_path
    else
      flash[:notice] = 'Lesson update error'
      redirect_to edit_lesson_path
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = 'Lesson deleted successfully'
    redirect_to lessons_path
  end

  def lesson_params
    params.require(:lesson).permit(:name, :course_id, :question, :options, :answer)
  end
end