class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postalCode
      t.float :lat
      t.float :lng
      t.string :category
      t.string :description
      t.string :url
      t.timestamps
    end
  end
end
