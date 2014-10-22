class Team < ActiveRecord::Base

  has_many :home_matches, :class_name => "Match", :foreign_key => "hometeam_id"
  has_many :away_matches, :class_name => "Match", :foreign_key => "awayteam_id"

  def matches
    Match.where(id: home_match_ids + away_match_ids)
  end


  def form
    matches.where(['matches.date < ?', Date.today]).order("matches.date desc")
  end

  def last_five_results
    form.limit(5).select([:fthg, :ftag, :htag, :hthg, :hometeam_id, :awayteam_id])
  end

  def last_five_results_percentage
    count_total = last_five_results.map(&:ft_goals?).count.to_f
    count_true = last_five_results.map(&:ft_goals?).count{|r|r}.to_f

    (count_true / count_total) * 100
  end

  def form_percentage
    count_total = form.map(&:ft_goals?).count.to_f
    count_true = form.map(&:ft_goals?).count{|r|r}.to_f

    (count_true / count_total) * 100
  end


end
