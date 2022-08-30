class TweetSearch < ApplicationRecord
    
    def search_tweets
        tweets = Tweet.all
        tweets = tweets.where(["content LIKE ?", "%#{keywords}%"]) if keywords.present?
        tweets = tweets.where(["user_id LIKE ?", user_id]) if user_id.present?
        return tweets
    end
end
