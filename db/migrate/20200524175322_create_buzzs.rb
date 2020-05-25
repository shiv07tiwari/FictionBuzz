class CreateBuzzs < ActiveRecord::Migration[6.0]
  def change
    create_table :buzzs do |t|
      t.text :content

      t.timestamps
    end
  end
end
