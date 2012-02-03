class Admin::ProjectsController < Admin::BaseController
  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_project, :only => [:edit, :update, :show, :destroy]
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to admin_projects_path, :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to admin_projects_path, :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, :notice => "Successfully destroyed project."
  end

  protected

  def find_project
    @project = Project.find(params[:id])
  end

  private

  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_params
    { :search => params[:search] }
  end
end
