class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = 'Course created successfully'
      redirect_to courses_path
    else
      render json: { error: 'Course creation error' },
             status: :unprocessable_entity
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = 'Course updated successfully'
      redirect_to courses_path
    else
      flash[:notice] = 'Course update error'
      redirect_to edit_course_path
    end
  end

  def destroy
    @lesson = Course.find(params[:id])
    @lesson.destroy
    flash[:notice] = 'User deleted successfully'
    redirect_to courses_path
  end

  def course_params
    params.require(:course).permit(:name)
  end
end