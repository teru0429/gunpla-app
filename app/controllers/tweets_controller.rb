class TweetsController < ApplicationController
  before_action :select_tweet, only: [:edit, :show, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    @tweet.update(tweet_params)
    if @tweet.save
      redirect_to root_path(@tweet)
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :text, :text1, :text2, :text3, :text4, :text5, :text6, :image).merge(user_id: current_user.id)
  end

  def select_tweet
    @tweet = Tweet.find(params[:id])
  end
end
