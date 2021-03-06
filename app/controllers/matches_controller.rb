class MatchesController < ApplicationController
  
  helper MatchesHelper

  def index
    
    @results = Match.where(['date < ?', Date.today]).order("date DESC")
    @fixtures = Match.where(['date >= ?', Date.today]).order("date ASC")
    @seven_days = @fixtures.where(['date between ? and ?', Date.today, Date.today + 14]).order("date ASC")

    if params[:q]
      @matches = Match.search(params[:q])
    else
      @matches = Match.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches, root: false }
    end
  end

  def results
    @results = Match.where(['date < ?', Date.today]).order("date DESC")

  end

  def import
    csv_file = params[:file].read
    CSV.parse(csv_file) do |row|
      match = Match.create(row)
    end
  end

  def show
    @match = Match.find(params[:id])
    @hometeam = @match.hometeam 
    @awayteam = @match.awayteam

    @history_home_team = Match.where(hometeam_id: @hometeam, awayteam_id:@awayteam)
    @history_away_team = Match.where(hometeam_id: @awayteam, awayteam_id:@hometeam)

    @all_history = (@history_home_team + @history_away_team).sort_by &:date

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
