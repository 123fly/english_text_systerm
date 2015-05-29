class CreateFours < ActiveRecord::Migration
  def change
    create_table :fours do |t|
       t.string :name
       t.string :user_id
       t.string :ban_ji
       t.string :card
       t.string :test_class
       t.string :test_number
       t.string :zuo_hao
       t.string :photo
      t.timestamps null: false
    end
  end
end
