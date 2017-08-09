class TranslationController < ApplicationController
  before_action :check_login

  def index
    puts @current_user.username
    @translations = Translation.where user_id: @current_user.id
  end

  protected
  def check_login
    if UserSession.find == nil
      render 'login'
    else
      @current_user = UserSession.find.user
    end
  end
end
