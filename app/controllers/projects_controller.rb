class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :project_owner?, except: [:index, :new, :create, :show]

  def index
    redirect_to root_path
  end

  def new
    @project = Project.new
  end

  def create
    @user = User.find(current_user)
    @project = @user.projects.new(permit)

    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @project = Project.find_by_name(params[:id])
    @issues = @project.issues
    @owner = User.find(@project.user_id)
  end

  def edit
    @project = Project.find_by_name(params[:id])
  end

  def update
    @project = Project.find_by_name(params[:id])

    if @project.update(permit)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    Project.find_by_name(params[:id]).destroy

    redirect_to root_path
  end

  private

  def project_owner?
    @project = Project.find_by_name(params[:id])
    redirect_to @project unless @project.user == current_user
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def permit
    project_params.permit(:name, :description)
  end
end
