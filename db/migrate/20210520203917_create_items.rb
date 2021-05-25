class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :catagory
      t.string :condition
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
