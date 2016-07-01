class CreateShopfbs < ActiveRecord::Migration
  def change
    create_table :shopfbs do |t|
        t.string :shopinfo_id, null: false
        t.string :fbshopname
        t.string :fbtitle, null: false
        t.text :fbcomment, null: false
        t.string :auther
        t.integer :fbrank, null: false
        t.string :ages, null: false
        t.string :jobs
      t.timestamps null: false
    end
    add_index :shopfbs, :shopinfo_id
  end
end
