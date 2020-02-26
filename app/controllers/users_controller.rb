# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_new_user, only: %i[index new]

  def index
    @users = User.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @user = User.new(user_params)
    authorize(@user)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize(@user)
  end

  def set_new_user
    @user = User.new
    authorize(@user)
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
