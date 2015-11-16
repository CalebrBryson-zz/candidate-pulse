class CandidatesController < ApplicationController
		def home_page
				@candidates = Candidate.all
		end		
end
