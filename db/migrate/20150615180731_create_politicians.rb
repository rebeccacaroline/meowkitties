class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :osid
      t.string :party
      t.string :gender
      t.string :birth_date
      t.string :office
      t.timestamps null: false
    end
  end
end
