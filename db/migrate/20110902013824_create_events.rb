class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.string :type, :limit => 1
      t.integer :year

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
