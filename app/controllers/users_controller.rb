class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(id: current_user.id), notice: '登録完了しました'
    else
      flash.now[:alert] = "登録が失敗しました"
      render :new
  end
end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_up_params)
      redirect_to user_path(id: params[:id])
    else
      flash.now[:alert] = "登録が失敗しました"
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_up_params
  params.require(:user).permit(:name, :picture, :profile)
  end




end
