require './alchemyapi'



class Tweet < ActiveRecord::Base
  belongs_to :author
  has_many :hashtags
  has_many :keywords
  attr_accessor :usernames, :tags

  include Twitter::Extractor

  def usernames
    @usernames = extract_mentioned_screen_names(self.text)
  end

  def tags
    @tags = extract_hashtags(self.text)
  end

  def store_tags
    self.tags.each do |tag|
      new_tag = Hashtag.new(:htag => tag)
      new_tag.tweet = self
      new_tag.save
    end
  end

  def find_keywords
    alchemyapi = AlchemyAPI.new()
    keywords = alchemyapi.keywords("text", text, options = {"sentiment" => 1})
    keywords["keywords"].each do |keyword|
      puts keyword["text"]
      puts keyword["relevance"]
      puts keyword["sentiment"]["score"]
      puts keyword["sentiment"]["type"]
    end
    return keywords
  end

  def store_keywords
    #IF the keywords have not been stored yet
    if Keyword.where(:tweet_id => self.id).empty?
      alchemyapi = AlchemyAPI.new()
      keywords = alchemyapi.keywords("text", text, options = {"sentiment" => 1})
      keywords["keywords"].each do |output|
        #Creates a new Keyword, Assigns the text to variable keyword,
        #associates the keyword to the tweet in context then savesa
        new_keyword = Keyword.new
        new_keyword.keyword = output["text"]
        new_keyword.relevance = output["relevance"]
        new_keyword.score = output["sentiment"]["score"]
        new_keyword.sentiment = output["sentiment"]["type"]
        new_keyword.tweet = self
        new_keyword.save
      end
    end
  end




end
