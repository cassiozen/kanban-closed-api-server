class AddAuthorizationToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :authorization_id, :integer
  end
end
