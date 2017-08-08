require 'yandex_dictionary'
class DictionaryController < ApplicationController
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

    puts dir.class.name

    puts dir[0]
    puts dir[1]

    begin
      @translation.to = YandexDictionary.translate(@translation.from, dir[0], dir[1])
    rescue NoMethodError #Ошибка возникает в геме.
      @errors = true
      render 'index'
    else
      @errors = false
      @translation.save
      render 'index'
    end

  end
end
