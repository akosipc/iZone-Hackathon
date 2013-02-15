class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      if @user.is_applicant?
        redirect_to thank_you_path, notice: 'Thank you for submitting your data!'
      elsif request.referrer.present?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        @user.set_to_applicant!
        pull_facebook_data(@user)
        redirect_to thank_you_path, notice: 'Thank you for submitting your data!'
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

end
