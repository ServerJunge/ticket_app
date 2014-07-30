class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :client
      t.boolean :archived, default: false, null: false

      t.timestamps
    end
  end
end
