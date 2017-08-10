require 'yandex_dictionary'
class DictionaryController < ApplicationController

  before_action :check_login

  def index
    @directions = YandexDictionary.get_languages
    @translation ||= Translation.new
  end

  def translate
    @directions = YandexDictionary.get_languages
    @translation = Translation.new

    translation_hash = params[:translation]
    @translation.from = translation_hash[:from]

    @translation.direction = params[:direction].tr("\"", '')
    dir = @translation.direction.split('-')

    begin
      @translation.to = YandexDictionary.translate(@translation.from, dir[0], dir[1])
    rescue NoMethodError #Ошибка возникает в геме.
      @errors = true
      render 'index'
    else
      @errors = false
      @current_user.translations.create(@translation.serializable_hash)
      render 'index'
    end

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
