class AddCommitmentToEngagement < ActiveRecord::Migration
  def change
    add_column :engagements, :commitment, :integer
  end
end
