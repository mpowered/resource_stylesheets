module ResourceStylesheets
  # Call this method in the <head> of your document. It will
  # include the stylesheet named after the current controller (resource)
  # 
  # You can specify extra stylesheets to be added to this resource's
  # views in the '/config/resource_stylesheets.yml' file.
  # Example:
  #    /config/resource_stylesheets.yml:
  #    products:
  #      - funky_side_bar
  #      - nifty_slider
  # 
  # All a resource's stylesheets are combined in a stylesheet called
  # 'resource_stylesheets.css'
  #
  def resource_stylesheets
    stylesheets = []
    # Add current resource's stylesheet if it exists
    stylesheets << current_controller.to_s if File.exists?(RAILS_ROOT + '/public/stylesheets/' + current_controller.to_s + '.css')
    # Add extra stylesheets for this resource as configured in resource_stylesheets
    config = YAML::load_file(RAILS_ROOT + '/config/resource_stylesheets.yml')
    stylesheets += config[current_controller.to_s] if config

    stylesheets.compact! # In case no extra stylesheets were configured
    stylesheets << {:cache => "#{current_controller}_stylesheets"} # Add cache option
    stylesheet_link_tag(*stylesheets)
  end
end

ActionView::Base.send(:include, ResourceStylesheets)