class Admin::EmployeesController < Admin::BaseController
  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_employee, :only => [:edit, :update, :show, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to admin_employees_path, :notice => "Successfully created employee."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @employee.update_attributes(params[:employee])
      redirect_to admin_employees_path, :notice  => "Successfully updated employee."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @employee.destroy
    redirect_to admin_employees_path, :notice => "Successfully destroyed employee."
  end

  protected

  def find_employee
    @employee = Employee.find(params[:id])
  end

  private

  def sort_column
    Employee.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_params
    { :search => params[:search] }
  end
end
