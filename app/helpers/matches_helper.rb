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

  def both_teams_last_five(match) 
    if ((match.hometeam.last_five_results_percentage) + (match.hometeam.last_five_results_percentage)) / 2 >= 70 
      content_tag(:div, content_tag(:p, "YES"), class: "awesome")
    elsif ((match.hometeam.last_five_results_percentage) + (match.hometeam.last_five_results_percentage)) / 2 >= 50  
      content_tag(:div, content_tag(:p, "MAYBE"), class: "ok")
    else
      content_tag(:div, content_tag(:p, "NO"), class: "bad")
    end
  end

  def both_teams_form(match) 
    if ((match.hometeam.form_percentage) + (match.hometeam.form_percentage)) / 2 >= 70 
      content_tag(:div, content_tag(:p, "YES"), class: "awesome")
    elsif ((match.hometeam.form_percentage) + (match.hometeam.form_percentage)) / 2 >= 50  
      content_tag(:div, content_tag(:p, "MAYBE"), class: "ok")
    else
      content_tag(:div, content_tag(:p, "NO"), class: "bad")
    end
  end

  def div_name(match)
    if match.div == "E0"
      "Premiership"
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

