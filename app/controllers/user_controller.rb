class UserController < ApplicationController
  def authenticate
    username = params[:user][:username]
    password = params[:user][:password]


    user = User.find_by username: username

    if user != nil && user.password == password
      session = UserSession.new(user, true)
      session.save
      redirect_to '/dictionary'
    else
      render 'login'
    end
  end

  def login
  end

  def create
    user = User.new(params.require(:user).permit(:username,:password))
    if user.save
      session = UserSession.new(user, true)
      session.save
      redirect_to '/dictionary'
    else
      @errors = true
      render 'user/new'
    end

  end

  def new
    @errors = false
  end
end
