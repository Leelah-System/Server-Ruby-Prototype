class Api::CategoryController < Api::ApiController

  def index
    categories = Category.all

    if categories
      response = formatted_response(true, {:categories => categories}, "")
    else
      response = formatted_response(false, nil, "")
    end
    
    render :json => response
  end

  def show
    category = Category.find(params[:id])    
    
    if category
      response = formatted_response(true, category, "")
    else
      response = formatted_response(false, nil, "")
    end

    render :json => response
  end

  def create
    category = Category.new(params[:category])

    if category.save
      response = formatted_response(true, category, "")
    else
      response = formatted_response(false, category.errors, t('api.message.category.create.failure'))
    end

    render :json => response
  end

  def update
    @category = Category.find(params[:id])

    if category.update_attributes(params[:category])
      response = formatted_response(true, category, "")
    else
      response = formatted_response(false, category.errors, t('api.message.category.update.failure'))
    end

    render :json => response
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
        response = formatted_response(true, nil, t('api.message.category.destroy.success'))
    else
      response = formatted_response(false, nil, t('api.message.category.destroy.failure'))
    end

    render :json => response
  end

end
