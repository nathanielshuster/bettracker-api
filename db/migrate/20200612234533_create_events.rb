class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :sport
      t.string :sport_nice
      t.string :home_team
      t.string :away_team
      t.integer :unix_time

      t.timestamps
    end
  end
end
