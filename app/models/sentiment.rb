class Sentiment < ActiveRecord::Base
  belongs_to :keyword
  attr_accessor :type

  def type
    if self.score < 0
      @type = "negative"
    else
      @type = "positive"
    end
  end

end
