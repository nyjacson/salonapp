class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :published_date, :datetime
  end
end
