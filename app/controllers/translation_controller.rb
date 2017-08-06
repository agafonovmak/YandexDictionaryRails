class TranslationController < ApplicationController
  def show
    @translation = Translation.find(params[:id])
  end

  def create
    @translation = Translation.create(params[:translation].permit(:from,:direction))
    # translation_hash = params[:translation]
    # @translation.from = translation_hash[:from]
    # @translation.direction = translation_hash[:direction]

    @translation.to = 'ПЕРЕВОД'

    redirect_to(@translation)
  end
end
