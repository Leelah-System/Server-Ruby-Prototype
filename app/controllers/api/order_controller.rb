class Api::OrderController < Api::ApiController
  def index
    @orders = Order.includes(:order_lines => :package_or_product).all
  end

  def show
    @order = Order.includes(:order_lines => :package_or_product).find(params[:id])
  end

  def create
    order = Order.new(params[:order])

    if order.save
      response = formatted_response(true, order, "")
    else
      response = formatted_response(false, order.errors, t('api.message.order.create.failure'))
    end

    render :json => response
  end

  def update
  end

  def destroy
  end

end
