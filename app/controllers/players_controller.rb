class PlayersController < ApplicationController

	def update
		@player = Player.find(params[:id])
		@table = Table.find(@player.table_id)

		if params[:call]
			@player.bet(@table.bet)
		elsif params[:check]
		elsif params[:raise]
			@player.bet(params[:raise][:bet])
		elsif params[:fold]
			@player.fold
			@player.save
		end

		if params[:decision]
			@player.decision
		end

		@table.action_on_seat = (@table.action_on_seat+1).to_s.split(//).map(&:to_i).inject(:+)
		@table.save

		redirect_to :back
	end

end
