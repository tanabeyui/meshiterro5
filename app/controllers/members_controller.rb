class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member[:id])
  end
  
  def member_params
    params.require(:member).permit(:name, :profile_image)
  end
end
