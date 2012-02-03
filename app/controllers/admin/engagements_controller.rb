class Admin::EngagementsController < Admin::BaseController
  before_filter :find_engagement, :only => [:edit, :update, :show, :destroy]
  def index
    @engagements = Engagement.all
  end

  def show
  end

  def new
    @engagement = Engagement.new
  end

  def create
    @engagement = Engagement.new(params[:engagement])
    if @engagement.save
      redirect_to admin_engagements_path, :notice => "Successfully created engagement."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @engagement.update_attributes(params[:engagement])
      redirect_to admin_engagements_path, :notice  => "Successfully updated engagement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @engagement.destroy
    redirect_to admin_engagements_path, :notice => "Successfully destroyed engagement."
  end

  protected

  def find_engagement
    @engagement = Engagement.find(params[:id])
  end
end
