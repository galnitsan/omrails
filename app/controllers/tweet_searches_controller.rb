class TweetSearchesController < ApplicationController

    def new
        @tweet_search = TweetSearch.new
        @user_ids = Tweet.uniq.pluck(:user_id)
        
        
    end

    def create
        @tweet_search = TweetSearch.create(tweet_search_params)
        redirect_to @tweet_search
    end

    def show
        @tweet_search = TweetSearch.find(params[:id])
    end


    private

    def tweet_search_params
        params.require(:tweet_search).permit(:keywords, :user_id, :username)
    end
end


