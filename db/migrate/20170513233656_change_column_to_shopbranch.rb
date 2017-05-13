class ChangeColumnToShopbranch < ActiveRecord::Migration
  def change
    def up
      change_column :address, unique: true
    end

    def down
      change_column :address
    end
  end
end
