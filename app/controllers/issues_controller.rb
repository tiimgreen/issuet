class IssuesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :issue_owner?, except: [:index, :new, :create, :show]

  def index
    redirect_to project_path(params[:project_id])
  end

  def new
    @issue = Issue.new
    @project = Project.find_by_name(params[:project_id] || params[:id])
  end

  def create
    @user = User.find(current_user)
    @project = Project.find_by_name(params[:project_id])
    @issue = @project.issues.new(permit)
    @issue.user = @user

    if @issue.save
      redirect_to project_issues_path(@project)
    else
      render 'new'
    end
  end

  def show
    @issue = Issue.find_by_number(params[:id])
    @project = Project.find_by_name(params[:project_id])
  end

  private

  def issue_owner?
    @issue = Issue.find_by_name(params[:id])
    redirect_to @issue unless @issue.user == current_user
  end

  def issue_params
    params.require(:issue).permit(:title, :body)
  end

  def permit
    issue_params.permit(:title, :body)
  end
end
