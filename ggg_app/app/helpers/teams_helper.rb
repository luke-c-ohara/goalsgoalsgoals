module TeamsHelper

  def ft_goals(match) 
    if match.fthg.to_i * match.ftag.to_i == 0
    content_tag(:div, content_tag(:p, "NO"), class: "bad")
    else
    content_tag(:div, content_tag(:p, "YES"), class: "good")
     end
  end


end
