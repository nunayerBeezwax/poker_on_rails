class TablesController < ApplicationController

  def create
    @table = Table.new
    @table.save
    9.times { player = Player.new({:name => Faker::Name.name, :chips => 1000, :table_id => @table.id})
    @table.players << player }
    redirect_to "/tables/#{@table.id}"
  end

  def show
    @table = Table.find(params[:id])
  end
end
