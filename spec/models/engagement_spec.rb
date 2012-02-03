require File.dirname(__FILE__) + '/../spec_helper'

describe Engagement do
  it "should be valid" do
    Engagement.new.should be_valid
  end
end
