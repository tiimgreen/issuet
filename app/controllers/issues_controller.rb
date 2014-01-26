class IssuesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :issue_owner?, except: [:index, :new, :create, :show]

  def index
    redirect_to project_path(params[:project_id])
  end

  def new
    @issue = Issue.new
  end
end
