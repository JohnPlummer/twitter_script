module ApplicationHelper

  def menu_link_to(title, options = {}, html_options = {})
    if current_page?(options)
      html_options[:class] ||= []
      html_options[:class] << "current"
    end

    link_to(title, options, html_options)
  end


  def main_nav
    links = []
    links << menu_link_to('Home', root_path, :title => 'Home')
    links << menu_link_to('Reciprocates', "#", :title => 'Reciprocates')

    menu(links)
  end

  # def user_nav
  #   links = []
  #   links << link_to("Signed in as " + current_user.email, '/') if current_user
  #   links << link_to("Not you? Sign out", destroy_user_session_path) if current_user
  #   links << link_to("Sign up ", new_user_registration_path) unless current_user
  #   links << link_to("Sign in ", new_user_session_path) unless current_user

  #   menu(links)
  # end

  def menu(links)
    content_tag :ul do
      convert_to_list(links).html_safe
    end
  end

  def convert_to_list(links)
    a = []
    links.each do |link|
      a << content_tag(:li, link)
    end
    a.join('')
  end

end
