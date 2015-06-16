class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :contributor
      t.references :politician
      t.integer :amount
      t.timestamps null: false
    end
  end
end
