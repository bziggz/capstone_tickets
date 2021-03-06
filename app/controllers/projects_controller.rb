class ProjectsController < ApplicationController
  before_action :logged_in_user, except: %i[index show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'Your project has been added to the system.'

      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:success] = 'Your project has been updated.'

      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
