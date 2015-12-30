class Candidate < ActiveRecord::Base
  has_one :author
  has_many :tweets, through: :author
  attr_accessor :positivity, :popularity, :jordanrank, :ISISrank

  def positivity
    score = 0
    self.tweets.each do |tweet|
      if tweet.keyword_score != nil
        score = score + tweet.keyword_score
      end
    end
    @positivity = score
  end

  def jordanrank
    @jordanrank = self.issue_score(Issue.find(2), Issue.first.issue_tweets)
  end

  def ISISrank
    @ISISrank = self.issue_score(Issue.first, Issue.first.issue_tweets)
  end

  def issue_score(issue, tweets)
    score = 0
    tweets.each do |tweet|
      if self.author.name == tweet.author.name
        score = score + 1
      end
    end
    return score
  end

  def keywords
    tweets = self.tweets
    keywords = []
    tweets.each do |tweet|
      tweet.keywords.each do |keyword|
        if keyword.score != nil
          keywords << keyword
        end
      end
    end
    return keywords
  end

    def popularity
      score = 0
      self.tweets.each do |tweet|
        if tweet.num_favorites != nil
          score = score + tweet.num_favorites
        end
      end
      @positivity = score
    end
end
