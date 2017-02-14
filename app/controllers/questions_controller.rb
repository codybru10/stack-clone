class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to user_questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to user_questions_path
    else
      render :edit
    end
  end
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to user_questions_path
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    if params[:upvote]
      @av = Answer.find(params[:upvote])
      @av.liked_by current_user
    end
    if params[:downvote]
      @av = Answer.find(params[:downvote])
      @av.disliked_by current_user
    end
  end

private
def question_params
  params.require(:question).permit(:title, :body, :score, :user_id, :tags)
end

end
