class EventSerializer < ActiveModel::Serializer
  attributes :id, :sport, :sport_nice, :home_team, :away_team, :unix_time, :sites

  def sites
    self.object.sites.map do |site|
      {
        site_name: site.site_name,
        site_nice: site.site_nice,
        home_line: site.home_line,
        away_line: site.away_line
      }
    end
  end
end
