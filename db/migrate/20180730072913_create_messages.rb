class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :read, default: true
    end
  end
end
