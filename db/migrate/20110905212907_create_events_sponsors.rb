class CreateEventsSponsors < ActiveRecord::Migration
  def up
    create_table :events_sponsors, :id => false do |t|
      t.integer :event_id
      t.integer :sponsor_id
    end
  end

  def down
    drop_table :events_sponsors
  end
end
