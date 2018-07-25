class CreateLawyersSpecializations < ActiveRecord::Migration[5.2]
  def change
    create_table :lawyers_specializations do |t|
      t.references :lawyer, foreign_key: true
      t.references :specialization, foreign_key: true

      t.timestamps
    end
  end
end
