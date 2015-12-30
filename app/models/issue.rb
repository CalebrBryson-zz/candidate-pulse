class Issue < ActiveRecord::Base


  def issue_tweets
    issue_tweets = []
    Issue.all.each do |issue|
      issue_keyword = Keyword.where(:keyword => issue.name)
      issue_keyword.each do |keyword|
        issue_tweets << keyword.tweet
      end
    end
    return issue_tweets
  end
end
