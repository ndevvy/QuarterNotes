class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false, index: true
      t.string :name, null: false, index: true
      t.timestamps null: false
    end

  end
end
