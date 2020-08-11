class ProjectsController < ApplicationController
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
    @project = Project.new(params.require(:project).permit(:name, :description))

    if @project.save
      flash[:success] = "Your project has been added to the system."
      redirect_to projects_path
    else
      render new_project_path
    end
  end

  def update  
    @project = Project.find(params[:id])
  end

  def destroy 
    @project = Project.find(params[:id])

    @project.destroy

    redirect_to projects_path
  end
end
