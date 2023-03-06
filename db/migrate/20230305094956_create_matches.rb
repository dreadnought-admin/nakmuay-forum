class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.boolean :liked
      t.integer :browsed_user_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.datetime "last_read_at"
      t.index ["browsed_user_id"], name: "index_matches_on_browsed_user_id"
      t.timestamps
    end
  end
end
