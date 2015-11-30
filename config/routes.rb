Rails.application.routes.draw do
	root 'candidates#home_page'
	resources :candidates
	resources :tweets
	get     'favorite_tweets'     => 'candidates#favorite_tweets'
	get     'positive_keywords'     => 'candidates#positive_keywords'
	get     'negative_keywords'     => 'candidates#negative_keywords'
	get     'most_used_keywords'     => 'candidates#most_used_keywords'
end
