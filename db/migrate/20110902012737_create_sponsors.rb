class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_info

      t.timestamps
    end
  end
end
