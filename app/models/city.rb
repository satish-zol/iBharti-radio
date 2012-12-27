class City < ActiveRecord::Base
  attr_accessible :name
  has_many :colleges
  has_many :songs, :through => :colleges
end
