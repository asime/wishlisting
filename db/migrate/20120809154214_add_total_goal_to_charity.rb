class AddTotalGoalToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :total_goal, :decimal
  end
end
