class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_question,
                  only: [:edit, :destroy, :update, :vote_up, :vote_down]
  #before_action :find_question, except: [:index, :new, :destroy, :update]

  #index is the standard for displaying all the questions
  def index
    @questions = Question.all    
  end

  def create
    #because the current_user has the question object connected to it, you can
    #use the current user to create a new questiona and also have a user ID connected to it
    #of the current user.
    #Same as @question = Question.new(question_attributes)
    #and @question.user = current_user
    @question = current_user.questions.new(question_attributes)

    if @question.save #check for validation errors etc, that it was entered into the datbase
      redirect_to questions_path, notice: "Your question was submitted and will be answered soon"
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
  end

  def update
    if @question.update_attributes(question_attributes)
      redirect_to @question, notice: "Your question was updated!"
    else
      render :edit
    end
  end

  def vote_up
    @question.increment!(:vote_count) # ! auto saves to database
    session[:has_voted] = true
    redirect_to @question
  end

  def vote_down
  end

  def destroy
    if @question.destroy
      redirect_to questions_path, notice: "Question deleted"
    else
      redirect_to question_path, error: "We had a problem deleting your question"
    end
  end

  def new
    @question = Question.new
  end

  private 

  def question_attributes
    params.require(:question).permit([:title,:description, {category_ids: []}]) 
  end

  def find_question
    @question = current_user.questions.find(params[:id])
  end


end
