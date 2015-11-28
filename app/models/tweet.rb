class Tweet < ActiveRecord::Base
  belongs_to :author
  has_many :hashtags
end
