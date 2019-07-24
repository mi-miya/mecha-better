SitemapGenerator::Sitemap.default_host = "https://mecha-better.ml"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{Rails.application.credentials[:aws][:s3_bucket_name]}"
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  Rails.application.credentials[:aws][:s3_bucket_name],
  aws_access_key_id: Rails.application.credentials[:aws][:access_key_id],
  aws_secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
  aws_region: 'ap-northeast-1'
)

SitemapGenerator::Sitemap.create do
  add root_path
  Idea.find_each do |idea|
    add idea_path(idea), :lastmod => idea.updated_at
  end
end