class CandidatesController < ApplicationController
		def home_page
			@candidates = Candidate.all
		end		
		def show
			@candidate = Candidate.find(params[:id])
		end
end
