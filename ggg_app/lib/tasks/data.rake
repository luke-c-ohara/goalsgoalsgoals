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

  desc "Import Premiership fixtures data."
  task :fixtures_p1 => :environment do

    require 'csv'

    team_aliases = {
      "spurs" => "Tottenham",
      "man utd" => "Man United"
    }

    league_aliases = {
      "p1" => "E0"
    }

    csv_file_path = '/Users/lukeohara/wdi_working/project_three/ggg_app/tmp/p1_fixtures_1415.csv'

    fixtures = CSV.read(csv_file_path)[1 .. -1]
    fixtures.each do |row|
       
      away = Team.find_by_name(team_aliases[row[0].downcase] || row[0])
      home = Team.find_by_name(team_aliases[row[2].downcase] || row[2])
      
      awayteam = away.id
      hometeam = home.id

      div = league_aliases[csv_file_path.split("/").last.split("_").first] 

      season_start = "2014/07/01".to_date
      season_end = "2015/05/31".to_date

      season_start_year = season_start.year
      season_end_year = season_end.year

      season_range = (season_start..season_end)

      date_range = (("2014/07/01".to_date)..("2014/12/31".to_date))

      date = Date.strptime(row[1], '%d %b')
        if date_range.include?(date)
          date1 = date 
          if season_range.include?(date)
              season = "#{season_start_year}/#{season_end_year} "
          end
        else 
          date1 = date + 1.year
          if season_range.include?(date1)
                season = "#{season_start_year}/#{season_end_year} "
          end
        end

     match = Match.find_or_create_by_season_and_hometeam_id_and_awayteam_id(season, hometeam, awayteam) 
        match.update_attributes(
            :date => date1,
            :div => div
            )
    end
  end

  desc "Import Team name CSV Data."
  task :team_names_p1 => :environment do

    require 'csv'

    target_url = "http://www.football-data.co.uk/mmz4281/1415/E0.csv"
    target_path = "/Users/lukeohara/wdi_working/project_three/ggg_app/tmp/p1.csv"

    Downspout.download_url_to_path( target_url, target_path )

    csv_file_path = '/Users/lukeohara/wdi_working/project_three/ggg_app/tmp/p1.csv'

    teams = CSV.read(csv_file_path)[1 .. -1]
    teams.each do |row|
      name = row[2]

      team = Team.find_or_create_by_name(name) 

    end
  end

end