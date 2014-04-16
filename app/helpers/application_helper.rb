module ApplicationHelper

  def add_breadcrumb(title, url=nil)
    @breadcrumbs << {:title => title, :url => url}
  end

  def flash_msg(name, msg)
    if ["info", "error", "warning", "notice"].include?(name)
      return content_tag :div, msg, class: "alert " + {"info" => "alert-info",
                       "notice" => "alert-success", "error" => "alert-danger",
                       "warning" => "alert-warning"}[name]
    end
  end
end
