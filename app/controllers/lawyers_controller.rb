class LawyersController < ApplicationController

  before_action :find_lawyer, only: [:show, :edit, :update, :destroy]

  require 'date'

  def new
    @lawyer = Lawyer.new
  end

  def index
    @yr = Date.today.year
    if params.has_key?(:user_id)
      @player = User.find(params[:user_id]).players
    else
      @player = Player.all
    end
  end
  
  def create
    @player = Player.new(player_params)
    @player.save
    redirect_to @player
  end

  def show
    @yr = Date.today.year
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to @player
  end

  def destroy
    @player.destroy
    redirect_to players_path
  end

private

  def player_params
    params.require(:player).permit(:name, :img, :team, :team_img, :b_year, :ppg, :rpg, :apg, :bpg, :user_ids => [])
  end

  def find_player
    @player = Player.find(params[:id])
  end

end