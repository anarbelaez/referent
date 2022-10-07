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
end
