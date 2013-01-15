class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy  

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    redirect_to root_path if signed_in?
    @user = User.new
  end

  def create
    redirect_to root_path and return if signed_in?
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      sign_in @user
      # render "users/#{@user}"
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end    
  end

  def edit
  #  @user = User.find(params[:id]) already defined by correct_user()
  end

  def update
  #  @user = User.find(params[:id]) already defined by correct_user()
    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = "Profile updated"
      sign_in @user 
      # this is because the remember token gets reset when the user is saved;
      # This is a nice security feature, as it means that any hijacked sessions will automatically expire when the user information is changed.
      redirect_to @user      
    else
      render 'edit'
    end    
  end

  def destroy
    user = User.find(params[:id])
    if user.admin?
      flash[:notice] = "One does not simply destroy himself"
    else
      user.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_url
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end    
end