class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :engagements
  has_many :employees, :through => :engagments
end
