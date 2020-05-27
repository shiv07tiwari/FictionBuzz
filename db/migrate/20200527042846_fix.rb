class Fix < ActiveRecord::Migration[6.0]
  def change
    create_table :buzzs do |t|
      t.text :content

      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :handle

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :handle, unique: true

  	add_reference :buzzs, :user, foreign_key: true

  	create_table :follow_relationships do |t|

      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
    add_index :follow_relationships, :follower_id
    add_index :follow_relationships, :followed_id
    add_index :follow_relationships, [:follower_id, :followed_id], unique: true

  end
end
