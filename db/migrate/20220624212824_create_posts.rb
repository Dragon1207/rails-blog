class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.boolean :published, null: false, default: false
      t.string :name
      t.string :slug
      t.text :description
      t.string :keywords
      t.date :published_date

      t.timestamps
    end
  end
end
