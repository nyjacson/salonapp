class CreateShopinfos < ActiveRecord::Migration
  def change
    create_table :shopinfos do |t|
        t.string :shopname, null: false
        t.text :company
        t.string :affili, null: false
        t.integer :ranking
        t.text :recommend
        t.string :shoptype, null: false
        t.string :treattype
        t.string :body
        t.string :machine
        t.text :campaign
        t.string :pic1
        t.string :pic2
        t.timestamps null: false
    end
    add_index :shopinfos, :shopname, unique: true
  end
end
