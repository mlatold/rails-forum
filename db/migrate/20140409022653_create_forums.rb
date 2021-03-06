class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.integer :parent
      t.integer :order

      t.timestamps
    end

    add_index :forums, :slug, unique: true
  end
end
