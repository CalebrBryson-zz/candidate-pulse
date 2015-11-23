class Author < ActiveRecord::Base
  belongs_to :candidate
  has_many :tweets
end
