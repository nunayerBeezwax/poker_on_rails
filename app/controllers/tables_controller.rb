class TablesController < ApplicationController

  def create
    @table = Table.new
    @table.save
    9.times { player = Player.new({:name => Faker::Name.name, :chips => 1000, :table_id => @table.id})
    @table.players << player }
    @table.create_dealer!
    @table.dealer.create_deck!
    rank = %w{ 2 3 4 5 6 7 8 9 10 11 12 13 14 }
    suit = %w{ C S H D }
    suit.each do |suit|
      rank.each do |rank|
        @table.dealer.deck.cards << Card.new({:suit => suit, :rank => rank, :pic => "#{rank}#{suit}.png"})
      end
    end
    redirect_to "/tables/#{@table.id}"
  end

  def show
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])

    if params[:flop]
      3.times { @table.cards << @table.dealer.give_card }
    end
    if params[:turn]
      @table.cards << @table.dealer.give_card
    end
    if params[:river]
      @table.cards << @table.dealer.give_card
    end

    if params[:preflop]
      @table.players.each do |player|
        until player.cards.count == 2 do
          player.cards << @table.dealer.give_card
        end
      end
    end

    if params[:new_hand]
      @table.players.each { |player| player.cards = [] }
      @table.cards = []
    end
    redirect_to :back
  end
end
