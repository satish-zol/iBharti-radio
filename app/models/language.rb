class Language < ActiveRecord::Base
  resourcify
  attr_accessible :name
end
