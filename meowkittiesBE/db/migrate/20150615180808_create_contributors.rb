class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :pac_id
      t.string :cont_id

      t.timestamps null: false
    end
  end
end
