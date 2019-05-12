module ApplicationHelper
  def navbar_item_active(menu)
    if menu == controller_name
      'active'
    else
      ''
    end
  end
end
