class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to reviews_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destory
    logout
    redirect_to root_url
  end

  private

  def log_in(user)
    session[:_user_id] = user.id;
  end

  def logout
    sesson.delete(user_id)
    @current_user = nil
  end
end
