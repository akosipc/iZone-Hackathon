class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      if request.referrer.eql? root_url
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        @user.set_to_applicant!
        redirect_to root_path, notice: 'Your applicant has been submitted'
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end
end
