class CommentsController < ApplicationController
  before_action :comment_owner?, only: %i[index]
  before_action :set_task, only: %i[new create]

  def index
    @comments = Comment.where(user: current_user)
    if params[:order].in? %w[new old]
      case params[:order]
      when 'new'
        @comments.order!(created_at: :desc)
      when 'old'
        @comments.order!(:created_at)
      end
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.task = @task
    if @comment.save
      redirect_to tasks_path
    else
      render :new, notice: 'Comment could not be created!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.task
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :like_status)
  end

  def comment_owner?
    @profile = Profile.find(params[:profile_id])
    if !current_user
      redirect_to root_path
    elsif current_user.profile != @profile && !@profile.share
      redirect_to root_path
    end
  end
end
