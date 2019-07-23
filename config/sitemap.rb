# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://mecha-better.ml"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add root_path
  add ideas_path

  # 各投稿をsitemapに追加する
  Idea.all.each do |idea|
    add idea_path(idea), lastmod: idea.updated_at
  end
end
