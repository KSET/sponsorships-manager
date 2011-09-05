class CreateCallers < ActiveRecord::Migration
  def up
    create_table :callers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :division

      t.timestamps
    end
  end

  def down
    drop_table :callers
    
  end
end
