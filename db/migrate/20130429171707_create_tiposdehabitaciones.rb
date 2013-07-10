class CreateTiposdehabitaciones < ActiveRecord::Migration
  def change
    create_table :tiposdehabitaciones do |t|
      t.string :tipo
      t.text :descripcion
      t.text :amenidades
      t.string :numero_de_habitacion

      t.timestamps
    end
  end
end