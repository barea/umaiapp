class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.string :weather_info
      t.string :city_name
      t.string :country
      t.datetime :dt

      t.timestamps
    end
  end
end
