class Tag < ActiveRecord::Base
  resourcify
  attr_accessible :name
end
