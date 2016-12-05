class Api::V1::SeasonsController < ApplicationController
  respond_to :json

  def index
    @seasons = Season.all.sort_by { |season| season.beginning_of_season }.reverse
  end
end
