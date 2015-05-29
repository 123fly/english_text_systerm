class PageController < ApplicationController
  def home
  end

  def landing


  end

  def user_landing
    if params[:id]=='ad'&&params[:pass]=='ad'
      render 'manager'
    else
      @user = User.authenticate(params[:id], params[:pass])
      if @user
        session[:user_id] = @user.id
        render 'student'
      else
        flash[:notice]="帐号与密码不匹配"
        render 'landing'
      end
    end

  end

  def register
    @users=User.new

  end

  def register_user
    @users = User.new(user_params)
    if @users.save
      render "landing"
    else
      render 'register'
    end
  end

  def user_params
    params.permit(:name, :user_id, :password, :email)
  end
  def register_siji
    @sijis = Score.new(siji_params)

    if @sijis.save
      render "landing"
    else
      render 'siji'
    end
  end

  def siji_params
    params.permit(:name, :user_id)
  end
  def manager

  end


  def student

  end

end
