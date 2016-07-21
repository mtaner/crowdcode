class ProjectsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create_with_user(project_params, current_user)
    redirect_to project_path(@project)
  end

 def show
   @project = Project.find(params[:id])
 end

private

  def project_params
    params.require(:project).permit(:name, :description, :launch_date)
  end


end
