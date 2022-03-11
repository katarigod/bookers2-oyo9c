class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :show, :edit, :about]
  
  def top
  end
  
  def about
  end

  def show
    if user_signed_in?
      redirect_to user_path(current_user.id) # ログイン済みのトップ画面
    else
      redirect_to '/users/sign_in' # ログインしてないトップ画面
    end
  end

  def edit
    if user_signed_in?
      redirect_to user_path(current_user.id) # ログイン済みのトップ画面
    else
      redirect_to '/users/sign_up' # ログインしてないトップ画面
    end
  end
end
