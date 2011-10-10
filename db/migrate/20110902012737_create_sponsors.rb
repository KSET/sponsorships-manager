class CreateSponsors < ActiveRecord::Migration
  def up
    create_table :sponsors do |t|
      t.string :name
      t.string :contact
      t.string :adress
      t.text :info

      t.timestamps
    end
  end

  def down
    drop_table :sponsors
  end
end
