class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
        t.string :title, null: false
        t.text :article, null: false
        t.string :category
        t.string :picthum
      t.timestamps null: false
    end
    add_index :articles, :title
  end
end
