class CreateAddNumberToFours < ActiveRecord::Migration
  def change
    create_table :add_number_to_fours do |t|

      add_column :fours, :number, :string
      t.timestamps null: false
    end
  end
end
