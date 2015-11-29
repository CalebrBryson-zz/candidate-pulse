require './alchemyapi'


class Tweet < ActiveRecord::Base
  belongs_to :author
  has_many :hashtags
  has_many :keywords

  def find_keywords
    alchemyapi = AlchemyAPI.new()
    keywords = alchemyapi.keywords("text", text, options = {"sentiment" => 1})
    keywords["keywords"].each do |keyword|
      puts keyword["text"]
      puts keyword["relevance"]
      puts keyword["sentiment"]["score"]
      puts keyword["sentiment"]["type"]
    end
  end

  def store_keywords
    alchemyapi = AlchemyAPI.new()
    keywords = alchemyapi.keywords("text", text)
    keywords.each do |keyword|
      sentiment = alchemyapi.sentiment("text", keyword.text)
      Keyword.create()
    end
  end



end
