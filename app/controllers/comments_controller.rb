class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], keiziban_id: comment_params[:sorfuw_id], user_id: current_user.id)
    redirect_to "/sorfuw/#{@comment.keiziban.id}"
  end

  private
  def comment_params
    params.permit(:text, :sorfuw_id)
  end
end
