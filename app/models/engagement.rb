class Engagement < ActiveRecord::Base
  attr_accessible :employee_id, :project_id, :commitment
  belongs_to :employee
  belongs_to :project
end
