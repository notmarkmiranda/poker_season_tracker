class PagesController < ApplicationController
  def index
    @leader         = Participant.leader
    @big_game       = Game.biggest
    @current_season = Season.find(Season.current)

  end
end
