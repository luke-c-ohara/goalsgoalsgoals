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

    @all_games = (@home_games + @away_games).sort_by &:date

    @fixtures = Match.find( :all, :conditions => ['date >= ?', Date.today], :order => "DATE(date) ASC")


    # @home_results = @home_games.where(hthg: present?)
    # @away_results = @away_games.where(hthg: present?)

    # @all_games = Match.where(@away_games || @home_games)
    # @team = @matches.map(&:hometeam).uniq
    
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
