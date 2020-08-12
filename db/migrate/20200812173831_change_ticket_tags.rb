class ChangeTicketTags < ActiveRecord::Migration[6.0]
  def change
    rename_column :ticket_tags, :category, :tag_id
    rename_column :ticket_tags, :post_id, :ticket_id
  end
end
