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

  def can_review?(referent)
    # if current_user.fashion_lover? && current_user.orders.first.closed?
    #   product.brand == referent.brand
    # end
    current_user.orders.any? { |order| order.closed? && order.product.brand == referent.brand }
  end
end
