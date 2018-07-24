class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      
      t.string :title
      t.string :specialization
      t.text :description
      
      t.timestamps
    end
  end
end
