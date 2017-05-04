# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://datsumoresq.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add static_pages_toku1_path
  add static_pages_toku2_path
  add static_pages_admin_path
  add search_tokyo1_path
  add search_tokyo2_path
  add search_ginza_path
  add search_shinjuku_path	
  add search_shibuya_path
  add search_ikebukuro_path
  add search_hokkaido_path
  add search_tohoku_path
  add search_kanto_path
  add search_chubu_path
  add search_kansai_path
  add search_chugoku_path
  add search_shikoku_path
  add search_kyushu_path
  add search_chiba_path
  add search_kanagawa_path
  add search_tochigi_path
  add search_gunma_path
  add search_ibaraki_path
  add search_saitama_path

  Shopinfo.find_each do |shopinfo|
    add shopinfo_path(shopinfo), :lastmod => shopinfo.updated_at
    shopinfo.shopbranches.find_each do |shopbranch|
      add shopinfo_shopbranch_path(shopinfo, shopbranch)
    end
  end
  Article.find_each do |article|
    add article_path(article), :lastmod => article.updated_at, :changefreq => 'weekly'
  end
  Shopfb.find_each do |shopfb|
    add shopfb_path(shopfb), :lastmod => shopfb.updated_at
  end
end
