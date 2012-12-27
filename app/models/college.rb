class College < ActiveRecord::Base
  belongs_to :city
  has_many   :songs
  attr_accessible :name, :city_id
end
