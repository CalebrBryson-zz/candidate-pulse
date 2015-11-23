class CandidatesController < ApplicationController
		def home_page
			@candidates = Candidate.all
			@republicans = Candidate.where(:party => "Republican")
			@democrats = Candidate.where(:party => "Democrat")
			@independents = Candidate.where(:party => "Independent")
		end
		def show
			@candidate = Candidate.find(params[:id])
		end
end
