class MatchesController < ApplicationController
  
  helper MatchesHelper

  def index
    @matches = Match.all

    respond_to do |format|
      format.html 

    end
  end

  def import
    csv_file = params[:file].read
    CSV.parse(csv_file) do |row|
      match = Match.create(row)
  
    end
  end

  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @match = Match.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @match = Match.new(params[:match])
  
    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end