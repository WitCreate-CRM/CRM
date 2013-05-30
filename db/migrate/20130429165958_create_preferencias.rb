class CreatePreferencias < ActiveRecord::Migration
  def change
    create_table :preferencias do |t|
      t.references :tiposdehabitacion
      t.references :huesped
      t.string :numero_almohada_en_cama

      t.timestamps
    end
    add_index :preferencias, :tiposdehabitacion_id
    add_index :preferencias, :huesped_id
  end
end
