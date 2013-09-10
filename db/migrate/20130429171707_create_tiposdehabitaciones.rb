class CreateTiposdehabitaciones < ActiveRecord::Migration
  def change
    create_table :tiposdehabitaciones do |t|
      t.string :tipo

      t.timestamps
    end
  end
end