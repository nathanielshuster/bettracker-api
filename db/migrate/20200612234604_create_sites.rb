class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :site_name
      t.string :site_nice
      t.decimal :home_line
      t.decimal :away_line
      t.integer :event_id

      t.timestamps
    end
  end
end
