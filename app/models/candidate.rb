class Candidate < ActiveRecord::Base
  has_one :author
  has_many :tweets, through: :author
  attr_accessor :positivity

  def positivity
    score = 0
    self.tweets.each do |tweet|
      if tweet.keyword_score != nil
        score = score + tweet.keyword_score
      end
    end
    @positivity = score
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
end
