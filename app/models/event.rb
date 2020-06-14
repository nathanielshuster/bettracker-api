class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  has_many :sites, dependent: :destroy

  accepts_nested_attributes_for :sites

  validates :sport, :sport_nice, :home_team, :away_team, :unix_time, :presence => true
end
