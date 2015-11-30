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

  def trump_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:realDonaldTrump", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@realDonaldTrump').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def hillary_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:HillaryClinton", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@HillaryClinton').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def ben_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:RealBenCarson", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@RealBenCarson').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def rand_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:RandPaul", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@RandPaul').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def omalley_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:MartinOMalley", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@MartinOMalley').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def bernie_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:BernieSanders", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@BernieSanders').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def jeb_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:JebBush", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@JebBush').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def christie_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:ChrisChristie", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@ChrisChristie').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def cruz_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:tedcruz", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@tedcruz').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def fiorina_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:CarlyFiorina", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@CarlyFiorina').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end
  def gilmore_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:gov_gilmore", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@gov_gilmore').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def graham_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:LindseyGrahamSC", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@LindseyGrahamSC').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def huckabee_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:GovMikeHuckabee", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@GovMikeHuckabee').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def kasich_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:JohnKasich", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@JohnKasich').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def pataki_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:GovernorPataki", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@GovernorPataki').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def rubio_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:marcorubio", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@marcorubio').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def santorum_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:RickSantorum", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@RickSantorum').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end

  def stein_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
    end

    client.search("from:DrJillStein", result_type: "popular").take(20).each do |tweet|
      new_tweet = Tweet.new
      new_tweet.text = tweet.text
      new_tweet.num_favorites = tweet.favorite_count
      new_tweet.num_retweets = tweet.retweet_count
      new_tweet.save
      author = Author.where(:name => '@DrJillStein').first
      author.tweets << new_tweet
      new_tweet.store_tags
    end
  end










end
