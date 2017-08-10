class HomeController < ApplicationController
  def index
  	if session[:in_game]
  		redirect_to games_path
  	end
  end
end