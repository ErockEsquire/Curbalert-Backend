class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :quality
      t.string :street_address
      t.string :city_address
      t.string :state_address
      t.string :zip_address
      t.text :comment
      t.integer :quantity
      t.string :time
      t.string :date
      t.float :latitude
      t.float :longitude
      t.boolean :claimed

      t.timestamps
    end
  end
end
