class CommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.member_id = current_member.id
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

end