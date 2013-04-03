class AddColumnApprovedToBill < ActiveRecord::Migration
  def change
    add_column :bills, :approved, :boolean
  end
end
