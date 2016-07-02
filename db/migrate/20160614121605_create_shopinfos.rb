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
        t.string :price1
        t.string :price2
        t.string :price3
        t.string :pic1
        t.string :pic2
        t.string :pic3
        t.string :pic4
        t.string :pic5
        t.text :recommend2
        t.text :recommend3
        t.timestamps null: false
    end
    add_index :shopinfos, :shopname, unique: true
  end
end
