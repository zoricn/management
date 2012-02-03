require File.dirname(__FILE__) + '/../spec_helper'

describe EngagementsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Engagement.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Engagement.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Engagement.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(engagement_url(assigns[:engagement]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Engagement.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Engagement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Engagement.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Engagement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Engagement.first
    response.should redirect_to(engagement_url(assigns[:engagement]))
  end

  it "destroy action should destroy model and redirect to index action" do
    engagement = Engagement.first
    delete :destroy, :id => engagement
    response.should redirect_to(engagements_url)
    Engagement.exists?(engagement.id).should be_false
  end
end
