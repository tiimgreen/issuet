class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(current_user)
    @project = Project.find_by(name: params[:project_id])
    @issue = @project.issues.find_by(number: params[:issue_id] || params[:id])
    @comment = @issue.comments.new(permit)
    @comment.user = @user

    if @comment.save
      redirect_to project_issue_path(@project.name, @issue.number)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def permit
    comment_params.permit(:body)
  end
end
