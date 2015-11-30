class CandidatesController < ApplicationController
		def home_page
			@candidates = Candidate.all
			@republicans = Candidate.where(:party => "Republican")
			@democrats = Candidate.where(:party => "Democrat")
			@independents = Candidate.where(:party => "Independent")
		end
		def show
			@candidate = Candidate.find(params[:id])
			@tweets = @candidate.tweets.limit(5)
		end

		def favorite_tweets
			@candidate = Candidate.find(params[:candidate])
			@tweets = @candidate.tweets.sort_by { |num_favorites| }
			@tweets = @tweets.first(10)
	  	end

		def negative_keywords
			@candidate = Candidate.find(params[:candidate])
		end

		def positive_keywords
			@candidate = Candidate.find(params[:candidate])
		end

		def most_used_keywords
			@candidate = Candidate.find(params[:candidate])
		end

end
