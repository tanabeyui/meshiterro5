class FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    favorite = Favorite.new(member_id: current_member.id, post_id: params[:post_id])
    favorite.save
    redirect_to post_path(post.id)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find_by(member_id: current_member.id, post_id: params[:post_id])
    favorite.destroy
    redirect_to post_path(post.id)
  end
    
end
