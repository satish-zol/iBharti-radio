class Category < ActiveRecord::Base
	resourcify
  attr_accessible :name
end
