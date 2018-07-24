class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      
      t.string :title
      t.string :specialization
      t.text :description
      t.references :client, foreign_key: true
      
      t.timestamps
    end
  end
end
