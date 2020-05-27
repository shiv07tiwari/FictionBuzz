class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  skip_before_action :verify_authenticity_token

  def show
  end

  def new
    if current_user
      redirect_to feed_url
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def follow
    current_user.followeds << @user
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_to user_path(@user)
  end

  def search
    @result = User.where("name ILIKE ?", params[:search][:query]).first
    if @result != nil
      redirect_to user_path(@result)
    else
      redirect_to feed_path, notice: 'Not found'
    end
        
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :handle)
    end
end
