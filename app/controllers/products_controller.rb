class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]


  def index
    val = params[:product_title] #検索されたワードを取り出す
    @searched_products = Product.where("product_title LIKE ?", "%#{val}%") 
    render json: @searched_products
  end


  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @product.destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
       #imageはactive strageに保存
      params.require(:product).permit(:product_title, :product_body, :product_price, :image)
    end
end
