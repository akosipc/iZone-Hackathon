class AnalyticsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @applicants = User.applicants
  end
end
