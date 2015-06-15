class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.reference :contributor
      t.reference :politician

      t.timestamps null: false
    end
  end
end
