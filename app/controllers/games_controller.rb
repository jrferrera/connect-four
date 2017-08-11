class GamesController < ApplicationController
	def index
	end

	def create
		session[:grid] = Grid.new
		session[:in_game] = true
		session[:player_one] = Player.new(1, params[:player_one], "blue")
		session[:player_two] = Player.new(2, params[:player_two], "red")

		session[:current_player] = session[:player_one]

		redirect_to games_path
	end

	def destroy
		session.destroy
		redirect_to root_path
	end
end