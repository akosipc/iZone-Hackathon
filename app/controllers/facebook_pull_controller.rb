class FacebookPullController < ApplicationController

  def index
      @user = User.last
      @graph = Koala::Facebook::GraphAPI.new(@user.access_token)

      @graph.batch do |batch_api|
        #personal details
        @profile = batch_api.get_object("me")

        #mutual friends (change this to reflect HR Groups username)
        @friends = batch_api.get_connections("me", "mutualfriends/Robbie.Mars")

        @likes = batch_api.get_connections("me","likes")
        #user likes

        #user posts
        @photos = batch_api.get_connections("me","photos")

        #user groups
        @groups = batch_api.get_connections("me","groups")

        #user events
        @events = batch_api.get_connections("me","events")
      end

  end

end
