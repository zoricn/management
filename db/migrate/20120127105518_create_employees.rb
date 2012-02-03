class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      t.integer :source
      t.string :country
      t.string :city
      t.integer :hour_rate
      t.integer :monthly_rate
      t.integer :availability
      t.integer :available
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
