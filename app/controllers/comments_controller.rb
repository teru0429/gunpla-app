class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to tweet_path(@comment.tweet.id)
    else
      @tweet = @comment.tweet
      @comments = @tweet.comments
      render "tweets/show"
      # redirect_to prototype_path(@comment.prototype.id)
      # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
