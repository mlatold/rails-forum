module ApplicationHelper

  def add_breadcrumb(title, url=nil)
    @breadcrumbs << {:title => title, :url => url}
  end
end
