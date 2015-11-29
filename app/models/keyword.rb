class Keyword < ActiveRecord::Base
  belongs_to :tweet
  has_many :sentiments

end
