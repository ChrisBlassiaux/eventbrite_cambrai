class UsersController < ApplicationController
  before_action :authenticate_user!    #, only: [:show]
  # before_action :his_profil, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def his_profil
    if current_user.id == params[:id]
      flash[:echec] = "Connecte toi pour voir ton profil !"
      redirect_to new_user_session_path
    end
  end
end
