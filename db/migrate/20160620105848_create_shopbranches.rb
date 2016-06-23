class CreateShopbranches < ActiveRecord::Migration
  def change
    create_table :shopbranches do |t|
        t.string :shopinfo_id, null: false
        t.string :shopname, null: false
        t.string :branchname, null: false
        t.string :address
        t.integer :tel
        t.string :starthour
        t.string :endhour
        t.string :e_starthour
        t.string :e_endhour
        t.string :holiday
        t.integer :latitude
        t.integer :longitude
        t.string :train
        t.string :station
        t.string :train2
        t.string :station2
        t.string :train3
        t.string :station3
        t.string :area
        t.string :prefec
        t.string :city
        t.text :access
        t.string :sheet
        t.text :info
      t.timestamps null: false
    end
    add_index :shopbranches, :shopinfo_id
    add_index :shopbranches, :branchname
    add_index :shopbranches, :station
  end
end
