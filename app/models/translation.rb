class Translation < ApplicationRecord
  belongs_to :user
  def make_array_from_string
    puts to
    to.gsub!(/[\[\]]/, '')
    puts to.split(',')
    return to.split(',')
  end
end
