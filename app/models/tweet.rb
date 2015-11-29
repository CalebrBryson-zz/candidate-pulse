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
    alchemyapi = AlchemyAPI.new()
    keywords = alchemyapi.keywords("text", text, options = {"sentiment" => 1})
    keywords["keywords"].each do |output|
      #Creates a new Keyword, Assigns the text to variable keyword,
      #associates the keyword to the tweet in context then savesa
      #If this keyword already exists, add the new Sentiment
      if Keyword.where(:keyword => output["text"]).empty?
        new_keyword = Keyword.new
        new_keyword.keyword = output["text"]
        new_keyword.tweet = self
        new_keyword.save
      else #find the existing keyword to add sentiment to
        new_keyword = Keyword.where(:keyword => output["text"])
      end

      #Creates the Sentiment
      new_sentiment = Sentiment.new
      #Assigns relevance, score, then associates keyword to our new keyword
      new_sentiment.relevance = output["relevance"]
      new_sentiment.score = output["sentiment"]["score"]
      new_sentiment.keyword = new_keyword
      #save
      new_sentiment.save
    end
  end




end
