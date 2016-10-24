class PagesController < ApplicationController
  def index
    @participants = Participant.all.sort_by { |participant| participant.evaluated_score }.reverse.take(5)
    @games        = Game.all.sort_by { |game| game.date }.reverse.take(5)
    @seasons      = Season.all.sort_by { |season| season.beginning_of_season }.reverse.take(5)
  end
end
