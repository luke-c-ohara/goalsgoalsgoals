class Match < ActiveRecord::Base

belongs_to :hometeam, :class_name => "Team"
belongs_to :awayteam, :class_name => "Team"


 attr_accessible :div, :date, :hometeam, :awayteam, :fthg, :ftag, :ftr, :hthg, :htag, :htr, :referee, :hs, :as, :hst, :ast, :hf, :af, :hc, :ac, :hy, :ay, :hr, :ar, :b365h, :b365d, :b365, :bwh, :bwd, :bwa, :iwh, :iwd, :iwa, :lbh, :lbd, :lba, :psh, :psd, :psa, :whh, :whd, :wha, :sjh, :sjd, :sja, :vch, :vcd, :vca, :bb1x2, :bbmxh, :bbavh, :bbmxd,  :bbavd, :bbmxa, :bbava, :bbou, :bbmx25, :bbavgt25, :bbmxlt25, :bbavlt25, :bbah, :bbahh, :bbmxahh, :bbavahh, :bbmxaha, :bbavaha, :season

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     Match.create(row.to_hash.symbolize_keys, :without_protection => true)
    end
  end

end




