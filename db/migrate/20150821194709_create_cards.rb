class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.string :color
      t.string :status

      t.timestamps null: false
    end
  end
end
