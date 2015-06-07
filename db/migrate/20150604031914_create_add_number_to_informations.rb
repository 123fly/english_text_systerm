class CreateAddNumberToInformations < ActiveRecord::Migration
  def change
    create_table :add_number_to_informations do |t|
           add_column :information, :number, :string
      t.timestamps null: false
    end
  end
end
