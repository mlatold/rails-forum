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

    change_column :forums, :order, :integer, default: 0
    change_column :forums, :parent, :integer, default: 0

    reversible do |dir|
      # These default forums/parents for reset
      dir.up do
        category = Forum.new(:title => "Forum Category", :slug => 'category',
                  :description => "A default category")

        Forum.new(:title => "Test Forum", :slug => 'test',
                  :description => "Look at me!", :parent => category.id,
                  :order => 1)

        Forum.new(:title => "Another Test Forum", :slug => 'another',
                  :description => "Hurray :D", :parent => category.id,
                  :order => 0)
      end
      # It's the first script, remove everything
      dir.down do
        Forum.delete_all()
      end
    end
  end
end
