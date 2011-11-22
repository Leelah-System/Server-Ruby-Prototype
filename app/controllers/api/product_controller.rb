class Api::ProductController < Api::ApiController

  def index
    products = Product.all

    if products
      response = formatted_response(true, {:products => products}, "")
    else
      response = formatted_response(false, nil, "")
    end

    render :json => response
  end

  def show
    product = Product.find(params[:id])

    if product
      response = formatted_response(true, product, "")
    else
      response = formatted_response(false, nil, "")
    end

    render :json => response
  end

  def create
    product = Product.new(params[:product])

    if product.save
      response = formatted_response(true, product, "")
    else
      response = formatted_response(false, product.errors, t('api.message.product.create.failure'))
    end

    render :json => response
  end

  def update
    @product = Product.find(params[:id])

    if product.update_attributes(params[:product])
      response = formatted_response(true, product, "")
    else
      response = formatted_response(false, product.errors, t('api.message.product.update.failure'))
    end

    render :json => response

  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
        response = formatted_response(true, nil, t('api.message.product.destroy.success'))
    else
      response = formatted_response(false, nil, t('api.message.product.destroy.failure'))
    end

    render :json => response
  end

end
