class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :office
      t.string :cid
      t.string :party
      t.string :state
      t.timestamps null: false
    end
  end
end
