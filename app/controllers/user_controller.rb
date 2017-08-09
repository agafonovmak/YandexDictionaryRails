class UserController < ApplicationController
  def authenticate
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.find_by username: username
    puts user.username

    if user.password == password
      session = UserSession.new(user, true)
      session.save
      puts UserSession.find.user.username
      redirect_to '/dictionary'
    else
      render 'login'
    end
  end

  def login
  end
end
