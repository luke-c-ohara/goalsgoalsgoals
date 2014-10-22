class Team < ActiveRecord::Base

  has_many :home_matches, :class_name => "Match", :foreign_key => "hometeam_id"
  has_many :away_matches, :class_name => "Match", :foreign_key => "awayteam_id"

  def matches
    Match.where(id: home_match_ids + away_match_ids)
  end

end
