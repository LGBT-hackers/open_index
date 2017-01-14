class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def nav_search_render(bool)
    @nav_search_render = bool
  end
end
