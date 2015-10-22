class AddRowOrderToCard < ActiveRecord::Migration
  def change
    add_column :cards, :row_order, :integer
  end
end
