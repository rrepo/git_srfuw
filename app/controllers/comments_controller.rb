class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], srfuw_id: comment_params[:srfuw_id], user_id: current_user.id)
    redirect_to "/srfuw/#{@comment.srfuw.id}"
  end
end
