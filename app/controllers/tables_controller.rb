class TablesController < ApplicationController

  def create
    @table = Table.new
    @table.button = rand(1..9)
    @table.bb = 50
    @table.sb = 25
    @table.save
    9.times { |i| player = Player.new({:name => Faker::Name.first_name, :chips => 1000, :table_id => @table.id, :seat => i+1 })
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
    @dealer = @table.dealer
    @button = @table.button
    @pot = @table.pot

    ### The course of one Hand

    if params[:preflop]
      @table.blinds_please
      @table.bet = @table.bb
      @table.action_on_seat = (@table.button+3).to_s.split(//).map(&:to_i).inject(:+)
      @table.save
      @table.players.each do |player|
        until player.cards.count == 2 do
          player.cards << @table.dealer.give_card
        end
      end
      ### if this is activated, pressing "Deal 'em" shows only 
      ### hands deemed worthy of playing
      ### other, temporary buttons added to watch the action happen
      # @table.round_of_betting
    end

    if params[:flop]
      @table.action_on_seat = (@table.button+1).to_s.split(//).map(&:to_i).inject(:+)
      3.times { @table.cards << @table.dealer.give_card }
    end
    if params[:turn]
      @table.action_on_seat = (@table.button+1).to_s.split(//).map(&:to_i).inject(:+)
      @table.cards << @table.dealer.give_card
    end
    if params[:river]
      @table.action_on_seat = (@table.button+1).to_s.split(//).map(&:to_i).inject(:+)
      @table.cards << @table.dealer.give_card
    end

    if params[:showdown]
      @dealer.showdown
    end

    ### New Hand Begins, Reset Table & Players

    if params[:new_hand]
      @table.players.each do |player| 
        player.cards = [] 
        player.hand = '' 
        player.imin = 0 
        player.save
      end

      @table.cards = []
      @table.pot = 0
      @table.bet = 0
      @table.button = (@table.button+1).to_s.split(//).map(&:to_i).inject(:+)
      @table.action_on_seat = 0

      @table.dealer.create_deck!
      rank = %w{ 2 3 4 5 6 7 8 9 10 11 12 13 14 }
      suit = %w{ C S H D }
      suit.each do |suit|
        rank.each do |rank|
          @table.dealer.deck.cards << Card.new({:suit => suit, :rank => rank, :pic => "#{rank}#{suit}.png"})
        end
      end
      @table.save
    end
    redirect_to :back
  end
end
