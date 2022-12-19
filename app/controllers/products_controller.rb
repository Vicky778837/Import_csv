class ProductsController < ApplicationController
def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv(['name', 'category', 'prices']) }
    end
  end

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end
