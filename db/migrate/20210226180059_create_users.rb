class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :token
      t.date :birthdate
      t.string :gender

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
