class AddAndAlterTicketsColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :user_id, :assignee
    add_column :tickets, :creator_id, :integer
  end
end
