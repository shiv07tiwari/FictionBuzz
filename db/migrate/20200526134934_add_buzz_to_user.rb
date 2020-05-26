class AddBuzzToUser < ActiveRecord::Migration[6.0]
  def change
  	remove_column :buzzs, :user_id
  	add_reference :buzzs, :user, foreign_key: true
  end
end
