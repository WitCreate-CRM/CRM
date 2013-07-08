class CreateTiposdehabitaciones < ActiveRecord::Migration
  def change
    create_table :tiposdehabitaciones do |t|
      t.string :nombre
      t.text :descripcion
      t.string :piso
      t.string :numero_de_habitacion

      t.timestamps
    end
  end
end
