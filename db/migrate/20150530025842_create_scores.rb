class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :user_id
      t.string :fen_shu
      t.string :name
      t.timestamps null: false
    end
  end
end
