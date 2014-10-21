module MatchesHelper

  def ht_goals(match) 
    if match.hthg.to_i * match.htag.to_i == 0
    content_tag(:div, content_tag(:p, "NO"), class: "bad")
    else
    content_tag(:div, content_tag(:p, "YES"), class: "good")
     end
  end

  def ft_goals(match) 
    if match.fthg.to_i * match.ftag.to_i == 0
    content_tag(:div, content_tag(:p, "NO"), class: "bad")
    else
    content_tag(:div, content_tag(:p, "YES"), class: "good")
     end
  end

  # def team_name(team_id)
  #   case team_id
  #   when 1 then
  #   when 2 then
  #   when 3 then
  #   when 4 then
  #   when 5 then
  #   when 6 then
  #   when 7 then
  #   when  then
  #   when then
  #   when then
  #   when then
  #   when then
  #   when then
  #   when then
  #   when then
  #   when then
  #   when then
  #   when then


  #   end
  # end

end

