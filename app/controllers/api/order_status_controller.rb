class Api::OrderStatusController < Api::ApiController

    def index
    order_statuses = Order_Status.all

    if order_statuses
      response = formatted_response(true, {:order_statuses => order_statuses}, "")
    else
      response = formatted_response(false, nil, "")
    end
    
    render :json => response
  end

  def show
    order_status = Order_Status.find(params[:id])    
    
    if order_status
      response = formatted_response(true, order_status, "")
    else
      response = formatted_response(false, nil, "")
    end

    render :json => response
  end

  def create
    order_status = Order_Status.new(params[:order_status])

    if order_status.save
      response = formatted_response(true, order_status, "")
    else
      response = formatted_response(false, order_status.errors, t('api.message.order_status.create.failure'))
    end

    render :json => response
  end

  def update
    @order_status = Order_Status.find(params[:id])

    if order_status.update_attributes(params[:order_status])
      response = formatted_response(true, order_status, "")
    else
      response = formatted_response(false, order_status.errors, t('api.message.order_status.update.failure'))
    end

    render :json => response
  end

  def destroy
    @order_status = Order_Status.find(params[:id])

    if @order_status.destroy
        response = formatted_response(true, nil, t('api.message.order_status.destroy.success'))
    else
      response = formatted_response(false, nil, t('api.message.order_status.destroy.failure'))
    end

    render :json => response
  end

  
end
