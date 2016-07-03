class StaticPagesController < ApplicationController
  def home
      @shopinfo = Shopinfo.all
      @shopbranch = Shopbranch.all
      @article_1 = Article.find_by_sql(['select * from articles where category = :cat', {cat: 'beginner'}])
  end
  def toku1
  end
  def toku2
  end
  def admin

  end
end
