class CreateCallers < ActiveRecord::Migration
  def change
    create_table :callers do |t|
      t.string :name
      t.string :division

      t.timestamps
    end
  end
end
