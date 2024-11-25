require 'news-api'

class NewsService
  def initialize
    @news_api = News.new(ENV['NEWS_API_KEY'])
  end

  def get_sources
    @news_api.get_sources(country: 'fr', language: 'fr')
  end

  def get_top_headlines
    @news_api.get_top_headlines(sources: 'bbc-news')
  end
end
