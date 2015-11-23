Rails.application.routes.draw do
	root 'candidates#home_page'
	resources :candidates
end
