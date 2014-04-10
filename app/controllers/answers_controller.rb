class AnswersController < ApplicationController
  before_action :find_question
                only: [:create, :destroy]

  def index   
  end

  def create
    #@question = Question.find params[:question_id]
    @answer = @question.answers.new(answer_attributes)
    @answer.user = current_user # you don't filter through the user, cause you want the answers for teh question
                                # not the answer that the user has done. The user hasn't asked this question.
    
    if @answer.save
      redirect_to @question, notice: "Answer created successfully"
    else
      render "/questions/show", error: "Error, question not added"
    end
  end

  def destroy
    @answer = @question.answer.find(params[:id])
    if @answer.destroy
      redirect_to @question, notice: "Answer Deleted"
    else
      redirect_to @question, error: "Answer not deleted"
    end
  end

  def new 
  end

  def update
  end

  private

  def answer_attributes
    params.require(:answer).permit([:body])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

end
