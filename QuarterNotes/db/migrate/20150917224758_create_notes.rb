class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :track_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end
