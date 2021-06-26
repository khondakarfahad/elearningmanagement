class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question created successfully'
      redirect_to questions_path
    else
      render json: { error: 'question creation error' },
             status: :unprocessable_entity
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Question updated successfully'
      redirect_to questions_path
    else
      flash[:notice] = 'Question update error'
      redirect_to edit_question_path
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'Question deleted successfully'
    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(:name, :lesson_id, :options, :answer)
  end
end