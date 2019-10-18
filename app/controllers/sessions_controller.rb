class SessionsController < ApplicationController
  def new
  end

  def create
    # 送られてきたメールアドレスでユーザーを検索。
    user = User.find_by(email: session_params[:email])
    # ユーザーが存在したときauthenticateメソッドでパスワード認証。 
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.user_id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end