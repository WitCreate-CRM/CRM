class CreateTiposdehabitaciones < ActiveRecord::Migration
  def change
    create_table :tiposdehabitaciones do |t|
      t.string :descripcion
      t.integer :piso
      t.boolean :habitacion_tina

      t.timestamps
    end
  end
end
