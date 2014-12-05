module ApplicationHelper

  def nav_pills
    content_tag(:ul, class: "nav nav-pills nav-stacked") do
      yield
    end
  end

  def nav_pill(text, path)
    options = current_page?(path) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end

end
