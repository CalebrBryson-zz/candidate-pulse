require './alchemyapi'


class Tweet < ActiveRecord::Base
  belongs_to :author
  has_many :hashtags
  has_many :keywords

  def sentiment
    alchemyapi = AlchemyAPI.new()
    keywords = alchemyapi.keywords("text", text)
    keywords.each do |keyword|
      puts keyword
      sentiment = alchemyapi.sentiment("text", keyword.text)
      puts sentiment
    end
  end

  def store_keywords
    alchemyapi = AlchemyAPI.new()
    keywords
  end



end
