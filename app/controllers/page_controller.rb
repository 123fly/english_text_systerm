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
    @scores = Four.new(siji_params)
    # @scoes.test_class = rand(30)
    @scores.zuo_hao = rand(30)
    # @scores.test_number = @sijis.user_id+@sijis.zuo_hao
    if @scores.save
      @scores = Four.find_by_user_id(params[:user_id])
      render "show"
    else
      render 'student'
    end
  end

  def siji_params
    params.permit(:name, :user_id, :ban_ji, :card)
  end

  def siji

  end

  def register_liuji
    @scores = Six.new(siji_params)
    # @scoes.test_class = rand(30)
    @scores.zuo_hao = rand(30)
    # @scores.test_number = @sijis.user_id+@sijis.zuo_hao

    if @scores.save
      @scores = Six.find_by_user_id(params[:user_id])
      render "show"
    else
      render 'student'
    end
  end

  def manager

  end

  def finding
    @scores = Four.where('user_id = ?', params[:user_id])
    render 'manager'
  end

  def siji_all
    @scores = Four.all
    render 'manager'
  end

  def liuji_all
    @scores = Six.all
    render 'manager'
  end

  def student

  end

end
