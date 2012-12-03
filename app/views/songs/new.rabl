object @song 
	attributes :id, :name, :file

child @categories do
	attributes :id, :name
end

child @languages do
	attributes :id, :name
end

child @tags do
	attributes :id, :name
end

