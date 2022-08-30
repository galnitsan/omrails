class TweetSearchesController < ApplicationController

    def new
        @tweet_search = TweetSearch.new
        @user_ids = Tweet.uniq.pluck(:user_id)
    end

    def create
        @tweet_search = TweetSearch.create(tweet_search_params)
           respond_to do |format|
            if @tweet_search.save
            format.js 
          else
            format.html { redirect_to @tweet_search, notice: "there was a problem." }
            format.js
            end  
        end
    end

    def show
        @tweet_search = TweetSearch.find(params[:id])
    end


    private

    def tweet_search_params
        params.require(:tweet_search).permit(:keywords, :user_id, :username)
    end
end


