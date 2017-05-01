class StaticPagesController < ApplicationController
  def home
      @shopinfo = Shopinfo.all
      @shopbranch = Shopbranch.all
      @article_1 = Article.find_by_sql(['select * from articles where category = :cat', {cat: '脱毛入門'}])
      @article_2 = Article.find_by_sql(['select * from articles where category = :cat OR category = :cat2', {cat: '脱毛マスター', cat2: '脱毛あれこれ'}])
      @article_3 = Article.find_by_sql(['select * from articles where category = :cat', {cat: 'キャンペーン'}])

  end
  def toku1
  end
  def toku2
  end
  def admin
    if !admin_signed_in?
      redirect_to new_admin_session_url
    end
  end
end
