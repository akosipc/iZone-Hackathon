class PagesController < ApplicationController
  def index
  end

  def features
  end

  def pricing

  end
  
  def about
  end

  def search
  end

  def filter
    @applicants = nil
    render 'search'
  end
end
