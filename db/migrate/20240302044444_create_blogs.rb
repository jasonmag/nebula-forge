class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.string :image_source

      t.timestamps
    end
  end
end
