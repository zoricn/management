class CreateEngagements < ActiveRecord::Migration
  def self.up
    create_table :engagements do |t|
      t.integer :employee_id
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :engagements
  end
end
