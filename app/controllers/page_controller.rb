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
    @scores = Information.new(siji_params)
    @scores.number = 4
    # @scores.photo =
    if @scores.save
      flash[:siji]='报名成功'
      render "student"
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
    @scores = Information.new(siji_params)
    @scores.number = 6
    if Score.find_by_user_id(params[:user_id]).fen_shu > '420'

      if @scores.save
        flash[:siji]='报名成功'
        render "student"
      else
        render 'liuji'
      end

    else
      flash[:siji]="请参加四级考试"
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
    @xx = Information.find_by_id(params[:id])
    if @xx.update(scores_params)
      flash[:siji]='修改成功'
      render 'student'
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
    render 'siji' ,:photo =>dir_path.to_json

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

  def shen_he
    @scores = Information.paginate :page => params[:page], :per_page => 3
    render 'shen_he'
  end

  def he
    @xin_xi = Four.new
    @score = Information.find_by_id(params[:format])
    @xin_xi.name = @score.name
    @xin_xi.user_id = @score.user_id
    @xin_xi.card = @score.card
    @xin_xi.ban_ji = @score.ban_ji
    @xin_xi.number = @score.number
    zuohao = rand(30)
    if zuohao == 0
      zuohao = rand(30)
    end
    test_class = 1
    length = Four.where('number=?', @score.number).length
    if length > 30
      test_class = test_class +(length/30).round
    else
      test_class = 1
    end
    @xin_xi.zuo_hao = zuohao
    @xin_xi.test_class = test_class
    if test_class < 10
      @xin_xi.test_class= '0'+@xin_xi.test_class
    end
    if @xin_xi.zuo_hao.length < 2
      @xin_xi.zuo_hao = '0'+@xin_xi.zuo_hao
    end
    @xin_xi.test_number = @xin_xi.user_id+@xin_xi.test_class+@xin_xi.zuo_hao
    if @xin_xi.save
      Information.delete_all(['id=?', params[:format]])
      render 'manager'
    else
      flash[:zuohao]= '座号错误'
     @scores = Information.paginate :page => params[:page], :per_page => 3
      render 'shen_he'
    end
  end

  def student_finding
    if params[:xuan_xiang]=='成绩查询'
      @score = Score.find_by_user_id(params[:user_id])
    else
      if Information.find_by_user_id(params[:user_id])== nil
        @scores = Four.find_by_user_id(params[:user_id])
      else
        @xx = Information.find_by_user_id(params[:user_id])
      end
    end
    render 'show'
  end

  def add_score
    @score = Score.new
    @score.user_id = params[:user_id]
    @score.fen_shu = params[:fen_shu]
    @score.name = Four.find_by_user_id(params[:user_id]).name
    if @score.save
      render 'score'
    else
      render 'score'
    end
  end

end
