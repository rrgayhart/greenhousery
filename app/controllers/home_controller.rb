class HomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :about]

  def about
  end

  def index
  end

  def test
  end
end
