class AddContactToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string
    add_column :employees, :skype, :string
  end
end
