class College < ActiveRecord::Base
  resourcify
  belongs_to :city
  has_many   :songs
  attr_accessible :name, :city_id
end
