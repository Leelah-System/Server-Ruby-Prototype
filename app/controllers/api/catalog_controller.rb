class Api::CatalogController < Api::ApiController
  def index
    @packages = Package.includes(:products).all
  end

  def show
    @package = Package.includes(:products).find(params[:id])

    unless @package
      response = formatted_response(
          false,
          nil,
          t('api.message.package.show.failure')
      )

      render :json => response
    end
  end

end
