require 'yandex_dictionary'
class DictionaryController < ApplicationController
  def index
    @translation ||= Translation.new
  end

  def translate
    @translation = Translation.create(params[:translation].permit(:from,:direction))
    # translation_hash = params[:translation]
    # @translation.from = translation_hash[:from]
    # @translation.direction = translation_hash[:direction]

    @translation.to = YandexDictionary.translate(@translation.from, 'ru', 'en')

    render 'index'
  end
end
