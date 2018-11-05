class SessionsController < ApplicationController
  def new
  end

  def destroy
      log_out
      redirect_to root_url
  end


  def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        redirect_to user_path(id: user.id), notice: 'ログインに成功しました'
      else
        flash.now[:danger] = "ログインに失敗しました"
        render 'new'
      end
    end

    private
    def log_in(user)
      session[:user_id] = user.id
    end

    def log_out
      session.delete(:user_id)
      @current_user =nil
    end
end
