class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @playlists = Playlist.all
    @userplaylists = UserPlaylist.all
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    # raise @user.inspect
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'hello'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end