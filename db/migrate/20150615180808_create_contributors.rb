class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|

      t.timestamps null: false
    end
  end
end
