class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @matches = Match.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    
    @matches = Match.all
    @teams = Team.all
    @team_page = Team.find(params[:id])

    @home_games = Match.where(hometeam_id: (params[:id]))
    @away_games = Match.where(awayteam_id: (params[:id]))

    @all_games = @team_page.matches.where(['date >= ?', Date.today]).sort_by &:date

    # @all_games = (@home_games + @away_games).sort_by &:date

    # @fixtures = Match.find( :all, :conditions => ['hometeam_id = ? or awayteam_id = ? and date >= ?', (params[:id]), (params[:id]), Date.today], :order => "DATE(date) ASC")

    # @results = Match.find( :all, :conditions => ['hometeam_id = ? or awayteam_id = ? and date < ?', (params[:id]), (params[:id]), Date.today], :order => "DATE(date) ASC")
    

    respond_to do |format|
      format.html 
    end
  end

  def new
    @team = Team.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


end
