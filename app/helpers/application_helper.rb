module ApplicationHelper

  def page_title title
    content_for :page_title, title.to_s
  end

end
