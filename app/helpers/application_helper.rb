module ApplicationHelper
  def navbar_item_active(menu)
    if menu == controller_name
      'active'
    else
      ''
    end
  end

  def show_poster(model, variant = nil)
    return if model.nil?

    return if model.image.nil?

    return unless model.image.attached?

    if variant.nil?
      image_tag(model.image, class: 'img-thumbnail')
    else
      image_tag(model.image.variant(resize: variant), class: 'img-thumbnail')
    end
  end
end
