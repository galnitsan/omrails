class CommentsController < ApplicationController

  # GET /comments 
  def index
    @comments = Comment.all
    @tweets = Tweet.order(created_at: :desc)
    
  end

  def create
        @tweet = Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.create(comment_params)

        respond_to do |format|
         if @comment.save
           format.html { redirect_to tweet_path(@tweet), notice: "Item was successfully created." }
           format.js 
          else
           format.html { redirect_to tweet_path(@tweet), notice: "there was a problem." }
           format.js
         end
       end
    end

    private def comment_params
      params.require(:comment).permit(:username, :body)
    end


end
