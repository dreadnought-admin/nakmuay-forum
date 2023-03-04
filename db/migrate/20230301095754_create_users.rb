class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :bio
      t.string :avatar, default: "https://i.imgur.com/kdJvj5l.png"
      t.string :password_digest
      t.string :email
      .string :roll, default: "user"
      t.timestamps
    end
  end
end
