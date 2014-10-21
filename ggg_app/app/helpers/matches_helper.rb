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


end

