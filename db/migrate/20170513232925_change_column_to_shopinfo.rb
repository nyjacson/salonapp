class ChangeColumnToShopinfo < ActiveRecord::Migration
  def change
    def up
      change_column :shopname, null: false, unique: true
    end

    def down
      change_column :shopname, null: false
    end
  end
end
