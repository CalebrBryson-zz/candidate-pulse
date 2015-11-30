class CandidatesController < ApplicationController
		def home_page
			@candidates = Candidate.all
			@republicans = Candidate.where(:party => "Republican")
			@democrats = Candidate.where(:party => "Democrat")
			@independents = Candidate.where(:party => "Independent")
			@mostpostitive = Candidate.all.sort_by &:positivity
			@leastpositive = @mostpostitive.first(5)
			@mostpostitive = @mostpostitive.reverse.first(5)
		end
		def show
			@candidate = Candidate.find(params[:id])
			@tweets = @candidate.tweets.limit(5)
		end

		def favorite_tweets
			@candidate = Candidate.find(params[:candidate])
			@tweets = @candidate.tweets.sort_by &:num_favorites
			@tweets = @tweets.reverse.first(10)

	  	end

		def negative_keywords
			@candidate = Candidate.find(params[:candidate])
			@keywords = @candidate.keywords.sort_by &:score
			@keywords = @keywords.first(10)
		end

		def positive_keywords
			@candidate = Candidate.find(params[:candidate])
			@keywords = @candidate.keywords.sort_by &:score
			@keywords = @keywords.reverse.first(10)
		end

		def most_used_keywords
			@candidate = Candidate.find(params[:candidate])
		end

end
