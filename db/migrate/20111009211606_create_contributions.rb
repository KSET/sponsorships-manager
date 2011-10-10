class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :status, :limit => 1, :default => 'N'
      t.decimal :amount, :default => 0
      t.text :other, :default => 'Nothing'
      
      t.integer :sponsor_id
      t.integer :event_id

      t.timestamps
    end
  end
end
