class GridsController < ApplicationController
	def update
		if session[:game_winner].nil?
			row = params[:row].to_i
			column = params[:column].to_i
			session[:grid]['matrix'][row][column] = session[:current_player]['number']

			session[:game_winner] = Grid.check_winner(session[:current_player], session[:grid]['matrix'], row, column)
			
			if session[:current_player]['number'] == 1
				session[:current_player] = session[:player_two]
			elsif session[:current_player]['number'] == 2
				session[:current_player] = session[:player_one]
			end
		end
		
		respond_to do |format|
			format.json { render json: {
					current_player_name: session[:current_player]['first_name'],
					current_player_color: session[:current_player]['color'],
					game_winner: session[:game_winner]
				},
				status: :ok
			}
		end
	end
end