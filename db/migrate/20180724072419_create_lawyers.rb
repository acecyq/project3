class CreateLawyers < ActiveRecord::Migration[5.2]
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :number
      t.string :specialization
      t.text :description
      t.string :photo
      t.string :firm
      t.string :address
      
      t.timestamps
    end
  end
end
