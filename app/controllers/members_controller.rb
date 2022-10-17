class MembersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.page(params[:pa])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member[:id])
  end
  
  
  private
  
  def member_params
    params.require(:member).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    member_id = params[:id].to_i
    login_user = current_member.id
    if (member_id != login_user)
      redirect_to posts_path
    end
  end
  
end
