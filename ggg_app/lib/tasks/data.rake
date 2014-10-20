namespace :csvimport do

  desc "Import Premiership CSV Data."
  task :matches_1 => :environment do

    require 'csv'

    target_url = "http://www.football-data.co.uk/mmz4281/1415/E0.csv"
    target_path = "/Users/lukeohara/wdi_working/project_three/ggg_app/tmp/p1.csv"

    Downspout.download_url_to_path( target_url, target_path )

    csv_file_path = '/Users/lukeohara/wdi_working/project_three/ggg_app/tmp/p1.csv'

    fixtures = CSV.read(csv_file_path)[1 .. -1]
      fixtures.each do |row|

      away = Team.find_or_create_by_name(row[3]) 
      home = Team.find_or_create_by_name(row[2])

      awayteam = away.id
      hometeam = home.id

      date = Date.strptime(row[1], "%d/%m/%y")

      season_start = "2014/07/01".to_date
      season_end = "2015/05/31".to_date

      season_start_year = season_start.year
      season_end_year = season_end.year

      season = "#{season_start_year}/#{season_end_year} "
   
      match = Match.find_or_create_by_season_and_hometeam_id_and_awayteam_id(season, hometeam, awayteam)
        match.update_attributes(
          :date => date,
          :div  => row[0],
          :fthg => row[4],
          :ftag => row[5],
          :ftr => row[6],
          :hthg => row[7],
          :htag => row[8],
          :htr => row[9]
          )  
      end
  end

end