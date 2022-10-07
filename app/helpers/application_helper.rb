module ApplicationHelper
  def referent_user?
    user_signed_in? && current_user.referent?
  end

  def referent_product?(product)
    user_signed_in? && current_user == product.user
  end

  def fashion_lover?
    user_signed_in? && current_user.fashion_lover?
  end

  def image(object)
    if object.photo.attached?
      cl_image_path object.photo.key
    else
      "https://www.online-tech-tips.com/wp-content/uploads/2022/03/image-41.jpeg"
    end
  end

  def can_review?(referent)
    # if current_user.fashion_lover? && current_user.orders.first.closed?
    #   product.brand == referent.brand
    # end
    current_user.orders.any? { |order| order.closed? && order.product.brand == referent.brand }
  end
end
