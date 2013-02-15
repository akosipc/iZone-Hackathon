class UsersController < ApplicationController
  
  before_filter :authenticate_user!,:except => [:applicant]
  inherit_resources

  def show
    @user = User.find params[:id]
    if @user.eql? current_user
      redirect_to profile_path
    end
    @gago = pull_facebook_data(@user)

  end

  def edit
  end

  def update
    update!(notice: 'User information successfully updated!') { redirect_to profile_path }
  end

  def show_profile
    @user = current_user 
  end

  def show_applicant
    @user = User.find(params[:id])
    @graph = Koala::Facebook::GraphAPI.new(@user.access_token)
    
    #mutual friends (change this to reflect HR Groups username)
    #@friends =  @graph.get_connections("me", "mutualfriends/"+current_user.username+"?fields=name,email,username,picture")
    @friends =  @graph.get_connections("me", "mutualfriends/godstrikerharvey?fields=name,email,username,picture")
     
    @friends.each do |friend|
      @user.mutual_friends.create!(email: friend["email"], name: friend["name"], username: friend["username"], picture: friend["picture"]["data"]["url"])
    end
  end

end
