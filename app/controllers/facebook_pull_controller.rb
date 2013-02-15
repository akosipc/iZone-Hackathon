class FacebookPullController < ApplicationController

  def index
      @user = User.find params[:id]
      @graph = Koala::Facebook::GraphAPI.new(@user.access_token)

      @profile = @graph.get_object("me")
  end

end
