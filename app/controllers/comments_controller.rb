class CommentsController < ApplicationController


    def create
        @tweet = Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.create(comment_params)

        if @comment.save
           redirect_to tweet_path(@tweet), notice: "Item was successfully created." 
         else
           redirect_to tweet_path(@tweet), notice: "there was a problem." 
        end
    end

    private def comment_params
      params.require(:comment).permit(:username, :body)
    end


end
