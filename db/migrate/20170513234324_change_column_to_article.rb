class ChangeColumnToArticle < ActiveRecord::Migration
  def change
    def up
      change_column :title, null: false, unique: true
    end

    def down
      change_column :title, null: false
    end
  end
end
