class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :name
      t.string :user_id
      t.string :card
      t.string :ban_ji
      t.timestamps null: false
    end
  end
end
