class AddUserIdToTranslation < ActiveRecord::Migration[5.1]
  def change
    add_column :translations, :user_id, :integer
  end
end
