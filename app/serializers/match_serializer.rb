class MatchSerializer < ActiveModel::Serializer
  attributes :id, :hometeam_id, :awayteam_id, :date, :div, :season, :hometeam_name, :awayteam_name

  def hometeam_name
    object.hometeam.try :name
  end

  def awayteam_name
    object.awayteam.try :name
  end

end
