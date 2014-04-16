class AddForums < ActiveRecord::Migration
  def change
    change_column :forums, :order, :integer, default: 0
    change_column :forums, :parent, :integer, default: 0

    reversible do |dir|
      # These default forums/parents for reset
      dir.up do
        category = Forum.create!(:title => "Forum Category", :slug => 'category',
                  :description => "A default category")

        Forum.create!(:title => "Test Forum", :slug => 'test',
                  :description => "Look at me!", :parent => category.id,
                  :order => 1)

        Forum.create!(:title => "Another Test Forum", :slug => 'another',
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
