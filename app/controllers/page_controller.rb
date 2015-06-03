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
    zuo_hao = rand(30)
    if zuo_hao = 0
      zuo_hao = rand(30)
    else
      if zuo_hao < 10
        zuo_hao = '0'+zuo_hao
      end
    end
    test_class = '01'
    if Four.find_by_number(4).zuo_hao.length>30
      test_class = test_class+(Four.find_by_number(4).zuo_hao.length/30).round
    else
      test_class = '01'
    end
    @scores.zuo_hao = zuo_hao
    @scores.test_class = test_class
    @scores.number= '4'
    @scores.test_number = @scores.user_id+@scores.test_class+@scores.zuo_hao
    if @scores.save
      @scores = Four.find_by_user_id(params[:user_id])
      render "show"
    else
      render 'siji'
    end
  end

  def siji_params
    params.permit(:name, :user_id, :ban_ji, :card)
  end

  def siji

  end

  def register_liuji
    @scores = Four.new(siji_params)
    zuo_hao = rand(30)
    if zuo_hao = 0
      zuo_hao = rand(30)
    else
      if zuo_hao < 10
        zuo_hao = '0'+zuo_hao
      end
    end
    test_class = '01'
    if Four.find_by_number(6).zuo_hao.length>30
      test_class = test_class+(Four.find_by_number(6).zuo_hao.length/30).round
    else
      test_class = '01'
    end
    @scores.test_class = test_class
    @scores.zuo_hao = zuo_hao
    @scores.number = '6'
    @scores.test_number = @scores.user_id+@scores.test_class+@scores.zuo_hao
    if Score.find_by_user_id(params[:user_id]).fen_shu > '420'

      if @scores.save
        @scores = Four.find_by_user_id(params[:user_id])
        render "show"
      else
        render 'liuji'
      end

    else
      flash[:notice]="请参加四级考试"
      render 'student'
    end
  end

  def manager

  end

  def finding
    if @scores = Four.where('user_id = ?', params[:user_id])==nil
      @scores = Six.where('user_id = ?', params[:user_id]).paginate :page => params[:page], :per_page => 5
    else
      @scores = Four.where('user_id = ?', params[:user_id]).paginate :page => params[:page], :per_page => 5
      render 'manager'
    end
  end

  def siji_all
    @scores = Four.where('number=?', 4).paginate :page => params[:page], :per_page => 3
    render 'manager'
  end

  def liuji_all
    @scores = Four.where('number=?', 6).paginate :page => params[:page], :per_page => 3
    render 'manager'
  end

  def student

  end

  def edit

  end

  def update
    @score = Four.find_by_id(params[:id])

    if @score.update(scores_params)
      render 'manager'
    else
      render 'edit'
    end
  end

  def scores_params
    params.permit(:name, :user_id, :ban_ji, :card)
  end

  def remove_user
    Four.delete(['id=?', params[:format]])
    render 'manager'
  end
  def add_excel
    file_upload(params[:file])
    render 'siji'

  end

  def file_upload(file)


    dir_path = "#{Rails.root}/public/images/embarrass/#{Time.now.strftime('%Y%m')}"

    if !File.exist?(dir_path)
      FileUtils.makedirs(dir_path)
    end

    #
    file_rename = "haha#{File.extname(file[:file].original_filename)}"
    file_path = "#{dir_path}/#{file_rename}"

    content = file[:file].read

    File.open(file_path, 'wb+') do |item|
      item.write(content)
    end
    store_path = "/images/embarrass/#{Time.now.strftime('%Y%m')}/#{file_rename}"
    return store_path
  end

end
