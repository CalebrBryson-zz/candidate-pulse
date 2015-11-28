class Candidate < ActiveRecord::Base
  has_one :author
  has_many :tweets, through: :author
end
