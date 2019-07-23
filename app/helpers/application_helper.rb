module ApplicationHelper
  def default_meta_tags
    {
      site: 'Mecha Better',
      title: 'MechaBetter',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: 'アイデアのCtoC!MechaBetterでアイデアを共有・実現して『めっちゃベター』な未来を作ろう！',
      keywords: 'アイデア,不満,共有,サービス',
      canonical: request.original_url,
      og: defalut_og,
      twitter: default_twitter_card,
      icon: [
        { href: image_url('mb_icon.png') },
        { href: image_url('mb_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('sns_card.jpg'),
        locale: 'ja_JP',

      },
      fg: {
        app_id: ""
      },
      twitter: {
        title: :title,
        description: :description,
        card: 'summary_large_image',
        site: "@mimi_2046",
        creator: '@mimi_2046',
        image: image_url("sns_card.jpg")
      }
    }
  end
end
