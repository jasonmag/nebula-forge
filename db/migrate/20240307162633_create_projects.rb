class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.string :tags
      t.string :image_source
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.boolean :published

      t.timestamps
    end
  end
end
