object @order
  attributes :id, :reference

  child :user do
    attributes :id, :first_name
  end

  child :order_lines do
    attributes :id, :quantity, :amount

    child :package_or_product do
      attributes :id, :label, :name
    end
  end