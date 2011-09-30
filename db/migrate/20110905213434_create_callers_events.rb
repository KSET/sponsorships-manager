class CreateCallersEvents < ActiveRecord::Migration
  def up
    create_table :callers_events, :id => false do |t|
      t.integer :caller_id
      t.integer :event_id
    end
  end

  def down
    drop_table :callers_events
  end
end
