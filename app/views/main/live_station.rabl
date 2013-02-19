collection :@live_stations
	attributes :id, :name, :url
		node(:name) {|clg| clg.name  if clg.present? }
		node(:live_url) {|clg| clg.url if clg.present? }
		node(:city) {|clg| clg.city.name if clg.present? && clg.city.present? }