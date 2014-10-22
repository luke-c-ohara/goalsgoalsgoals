module MatchesHelper

  def ht_goals(match) 
    if match.ht_goals?
      content_tag(:div, content_tag(:p, "YES"), class: "good")
    else
      content_tag(:div, content_tag(:p, "NO"), class: "bad")
    end
  end

  def ft_goals(match) 
    if match.ft_goals?
      content_tag(:div, content_tag(:p, "YES"), class: "good")
    else
      content_tag(:div, content_tag(:p, "NO"), class: "bad")
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

