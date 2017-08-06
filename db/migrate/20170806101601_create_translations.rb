class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.string :from
      t.string :to
      t.string :direction

      t.timestamps
    end
  end
end
