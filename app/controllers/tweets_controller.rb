class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :validate_change, only: [:edit, :destroy]

  # GET /tweets
  def index
    @tweets = Tweet.order(created_at: :desc)
    @comments = Comment.all
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments.create()
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.new(tweet_params)

    respond_to do |format|
    if @tweet.save
     format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
     format.js
    else
     format.html { render :new } 
     format.js
    end
   end
  end

  # PATCH/PUT /tweets/1
  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content)
    end

    def validate_change
    @tweet = current_user.tweets.find(params[:id])
      if @tweet.created_at < 5.seconds.ago
       redirect_to :back, notice: '5 seconds passed. Tweet cannot be changed.'
      end
  end
    
end