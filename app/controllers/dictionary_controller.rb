class DictionaryController < ApplicationController
  def index
    @translation ||= Translation.new
  end

  def translate
    @translation = Translation.create(params[:translation].permit(:from,:direction))
    # translation_hash = params[:translation]
    # @translation.from = translation_hash[:from]
    # @translation.direction = translation_hash[:direction]

    if(@translation.from == '1')
      @translation.to = 'ПЕРЕВОД'
    else
      @translation.to = 'ПЕРЕВОД1243124'
    end

    render 'index'
  end
end
