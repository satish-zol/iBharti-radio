ActiveAdmin.register_page "Dashboard" do


  #menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
=begin
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
=end  
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Models" do
          ul do
            
            li link_to("Admin Users", admin_admin_users_path)
            li link_to("Categories", admin_categories_path)
            li link_to("Cities", admin_cities_path)
            li link_to("Colleges", admin_colleges_path)
            li link_to("Languages", admin_languages_path)
            li link_to("Songs", admin_songs_path)
            li link_to("Users", admin_users_path)
            li link_to("Roles", admin_roles_path)
            li link_to("Tags", admin_tags_path)
            #li link_to("Playlist", show_playlist_path)
            li link_to("Playlists", admin_playlist_path)
            li link_to("Schedules", admin_schedules_path)
          end
        end
      end
      # TO reduce the size of the panel  
      column do
      end
      
    end
  end  
end
