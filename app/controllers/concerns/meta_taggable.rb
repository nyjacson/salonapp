module MetaTaggable
  extend ActiveSupport::Concern

  include ActionView::Helpers::AssetUrlHelper

  included do
    before_action :prepare_meta_tags
  end

  private

  def prepare_meta_tags(options = {})
    base = t('meta_tags.base')

    site = "美容脱毛比較.net"
    description = "脱毛に関する最新のトレンド、研究結果を調査、公開しています。"
    title = "美容脱毛比較.net | トップページ"
    image = image_url('image.png')

    defaults = {
      site: site,
      title: title,
      description: description,
      keywords: "脱毛 脱毛サロン 美容",
      og: {
        url: request.url,
        title: title,
        description: description,
        site_name: site,
        type: 'article',
        image: image
      },
      twitter: {
        card: 'summary',
        site: '@simpliejp',
        title: title.presence || site,
        description: description,
        image: image
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags(options)
  end
end