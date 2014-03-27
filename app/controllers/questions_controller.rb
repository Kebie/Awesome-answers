class QuestionsController < ApplicationController
  #index is the standard for displaying all the questions
  def index
    @questions = Question.all    
  end

  def create
    @question = Question.new(question_attributes)
    if @question.save #check for validation errors etc, that it was entered into the datbase
      redirect_to questions_path, notice: "Your question was submitted and will be answered soon"
    else
      render :new
    end
  end

  def show
    @id = params[:id]
  end

  def edit
    @id = params[:id]
  end

  def update
    
  end

  def destroy
    @id = params[:id]
  end

  def new
    @question = Question.new
  end

  private 

  def question_attributes
    params.require(:question).permit([:title,:description]) 
  end

end
