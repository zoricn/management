require File.dirname(__FILE__) + '/../spec_helper'

describe Employee do
  it "should be valid" do
    Employee.new.should be_valid
  end
end
