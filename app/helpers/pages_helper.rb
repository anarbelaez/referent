module PagesHelper
  def product?(object)
    object.searchable_type == "Product"
  end
end
