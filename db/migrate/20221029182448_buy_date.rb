class BuyDate < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :buy_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
