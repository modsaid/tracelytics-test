class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :code
      t.string :name
      t.integer :category_id

      t.timestamps
    end

    add_index :products, :code
  end

  def self.down
    remove_index :products, :code
    drop_table :products
  end
end
