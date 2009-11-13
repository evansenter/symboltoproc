# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def logged_in_notice
    admin? ? " You are currently logged in, " + link_to("logout?", logout_path) : ""
  end
end
