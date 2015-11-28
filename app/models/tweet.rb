require './alchemyapi'


class Tweet < ActiveRecord::Base
  belongs_to :author
  has_many :hashtags

  def sentiment
    alchemyapi = AlchemyAPI.new()
    keywords = alchemyapi.keywords("text", text)
    keywords.each do |keyword|
      puts keyword
    end
  end


end
