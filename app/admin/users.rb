ActiveAdmin.register User do
  menu false
  
   config.sort_order = "id_asc"
   config.per_page = 10

   index do
   	column :id, :sortable => true
   	column :email, :sortable => true
   	default_actions
   end

end
