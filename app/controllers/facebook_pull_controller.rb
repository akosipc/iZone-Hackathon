class FacebookPullController < ApplicationController

  def index
      @user = User.last
      @graph = Koala::Facebook::GraphAPI.new(@user.access_token)

      @profile, @friends, @likes, @photos,@groups,@events =  @graph.batch do |batch_api|
        #personal details
        batch_api.get_object("me")

        #mutual friends (change this to reflect HR Groups username)
        batch_api.get_connections("me", "mutualfriends/Robbie.Mars")

        #user likes
        batch_api.get_connections("me","likes")

        #user posts
        batch_api.get_connections("me","photos")

        #user groups
        batch_api.get_connections("me","groups")

        #user events
        batch_api.get_connections("me","events")
      end

  end

end
