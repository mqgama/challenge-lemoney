module ApplicationHelper
  def notice_css_class(kind)
    case kind.to_sym
    when :notice
      'success'
    when :alert
      'danger'
    end
  end

  def custom_menu_item(link:, icon:, text:, method: :get)
    content_tag :li, class: 'nav-item' do
      link_to link, class: 'nav-link', method: method do
        concat(content_tag :i, '', class: "#{icon} nav-icon")
        concat(content_tag :span, text)
      end
    end
  end

end