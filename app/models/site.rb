class Site < ApplicationRecord
  belongs_to :event

  validates :site_name, :site_nice, :home_line, :away_line, :presence => true
end
