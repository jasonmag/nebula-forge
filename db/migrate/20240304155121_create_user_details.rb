class CreateUserDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :profile_image
      t.text :address
      t.string :position

      t.timestamps
    end
  end
end
