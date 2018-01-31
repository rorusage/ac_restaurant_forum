class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Successfully friend"
      redirect_to :back
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:alert] = "friendship destroyed"
    redirect_to :back
  end
end
