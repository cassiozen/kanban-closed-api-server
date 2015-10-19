class CreateAuthorization < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :key
      t.timestamps null: false
    end
  end
end
