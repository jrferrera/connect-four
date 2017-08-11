class GridsController < ApplicationController
	def update
		@row = params[:row].to_i
		@column = params[:column].to_i
		session[:grid]['matrix'][@row][@column] = session[:current_player]['number']

		if session[:current_player]['number'] == 1
			session[:current_player] = session[:player_two]
		elsif session[:current_player]['number'] == 2
			session[:current_player] = session[:player_one]
		end
		
		respond_to do |format|
			format.json { render json: {
					current_player_name: session[:current_player]['first_name'],
					current_player_color: session[:current_player]['color']
				},
				status: :ok
			}
		end
	end
end