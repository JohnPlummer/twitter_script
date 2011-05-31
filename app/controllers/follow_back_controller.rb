class FollowBackController < ApplicationController
  def index
    @user = client.user if signed_in?
    # @follow_backs = @user.follower_ids - @user.friend_ids
  end

end
