class MatchesController < ApplicationController
  
  helper MatchesHelper

  def index
    @all_matches = Match.find( :all, :order => "DATE(date) ASC")
    @fixtures = Match.find( :all, :conditions => ['date >= ?', Date.today], :order => "date ASC")

    if params[:q]
      @matches = Match.search(params[:q])
    else
      @matches = Match.all
    end
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @matches }
    end

  def results
    @results = Match.all

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
    hometeam = @match.hometeam 
    awayteam = @match.awayteam

    @history_1 = Match.where(hometeam_id: hometeam, awayteam_id:awayteam)
    @history_2 = Match.where(hometeam_id: awayteam, awayteam_id:hometeam)

    @all_history = (@history_1 + @history_2).sort_by &:date


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
