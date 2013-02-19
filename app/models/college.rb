class College < ActiveRecord::Base
  resourcify
  belongs_to :city
  has_many   :songs
  attr_accessible :name, :url, :city_id
end
