class CreateSponsors < ActiveRecord::Migration
  def up
    create_table :sponsors do |t|
      t.string :name
      t.string :contact
      t.string :adress
      t.string :status, :limit => 1
      t.decimal :amount
      t.text :info

      t.timestamps
    end
  end

  def down
    drop_table :sponsors
  end
end
