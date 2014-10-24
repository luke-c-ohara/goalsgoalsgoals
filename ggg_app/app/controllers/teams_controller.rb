class TeamsController < ApplicationController

  def index
    @teams = Team.all.sort_by &:name
    @matches = Match.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    
    @matches = Match.all
    @teams = Team.all
    @team_page = Team.find(params[:id])

    @home_games = Match.where(hometeam_id: (params[:id])).limit(5).sort_by &:date
    @away_games = Match.where(awayteam_id: (params[:id])).limit(5).sort_by &:date

    @all_games = @team_page.matches.where(['date >= ?', Date.today]).sort_by &:date

    @all_results = @team_page.matches.where(['date < ?', Date.today]).limit(10).sort_by &:date

    @recent_form = @team_page.matches.where(['date < ?', Date.today]).order("date desc").limit(5)

    @last =  @recent_form.select([:fthg, :ftag, :hometeam_id, :awayteam_id])
    
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
