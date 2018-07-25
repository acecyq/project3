class AddUserToClients < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :user, foreign_key: true
    add_reference :lawyers, :user, foreign_key: true
  end
end
