class CreateTicketTags < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_tags do |t|
      t.integer :category, :post_id
      t.timestamps
    end
  end
end
