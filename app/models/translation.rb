class Translation < ApplicationRecord
  belongs_to :user
  def make_array_from_string
    to.gsub!(/[\[\]]/, '')
    return to.split(',')
  end
end
