class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def nav_search_render
    @nav_search_render = true
  end
end
