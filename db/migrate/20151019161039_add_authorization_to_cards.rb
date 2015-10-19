class AddAuthorizationToCards < ActiveRecord::Migration
  def change
    add_column :cards, :authorization_id, :integer
  end
end
