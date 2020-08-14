class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :creator
      t.text :body
      t.integer :ticket_id
      t.timestamps
    end
  end
end
