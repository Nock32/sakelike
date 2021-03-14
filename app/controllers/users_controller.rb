class UsersController < ApplicationController

  def edit
  end

  def update
    binding.pry
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation,:family_name, :first_name, :family_name_kana, :first_name_kana,:birthday)
  end
end