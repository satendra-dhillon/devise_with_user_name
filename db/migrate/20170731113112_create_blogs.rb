class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    	t.string :title
    	t.text :description
    	t.integer :views
    	t.belongs_to :category
    	t.belongs_to :blogger

      t.timestamps
    end
  end
end
