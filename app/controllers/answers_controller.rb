class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.question.save
      @answer.update(score: 0)
      redirect_to :back
    else
      flash[:alert] = "Answer not saved"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to user_question_path(current_user, @question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to user_question_path(current_user, @question)
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(score: (@answer.score + params[:score]))
 end


  private
  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id, :best_answer, :score)
  end
end
