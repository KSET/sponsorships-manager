class CreateEventTypes < ActiveRecord::Migration
  def up
    create_table :event_types do |t|
      t.string :name
      t.text :description
    end

  end

  def down
    drop_table :event_types
  end
end
