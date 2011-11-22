module Admin::CatalogManagement::ProductsHelper

  def show_product?
    controller.controller_name == 'products' and controller.action_name == 'show'
  end

end
