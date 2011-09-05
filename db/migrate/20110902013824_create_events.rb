class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.integer :year
      t.references :event_type
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
