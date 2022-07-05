xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9', 'xmlns:image' => 'http://www.google.com/schemas/sitemap-image/1.1', 'xmlns:video' => 'http://www.google.com/schemas/sitemap-video/1.1' do
  xml.url do
    xml.loc root_url
  end

  xml.url do
    xml.loc about_url
  end

  xml.url do
    xml.loc posts_url
  end

  @posts.in_groups_of(1000, false).each do |posts|
    posts.each do |post|
      xml.url do
        xml.loc post_url(post.slug)
        xml.lastmod post.published_date.xmlschema
      end
    end
  end

  xml.url do
    xml.loc tags_url
  end

  @tags.each do |tag|
    xml.url do
      xml.loc tag_url(tag.slug)
    end
  end
end
