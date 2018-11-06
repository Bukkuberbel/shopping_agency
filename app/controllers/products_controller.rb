class ProductsController < ApplicationController
   before_action :logged_in?
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
    @cart = Cart.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to cart_path(product_id: params[:product_id]), notice: '買い物かごにいれる'
    else
      flash.now[:alert] = "買い物かごに入れられませんでした"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:description,:image)
  end
end
