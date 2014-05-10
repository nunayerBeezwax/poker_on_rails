class PlayersController < ApplicationController

	def update
		@player = Player.find(params[:id])
		if params[:fold]
			@player.fold
			@player.save
		end
		@table = Table.find(params[:table])
		@table.action_on_seat = (@table.action_on_seat+1).to_s.split(//).map(&:to_i).inject(:+)
		@table.save
		redirect_to :back
	end

end
