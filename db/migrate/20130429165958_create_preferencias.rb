class CreatePreferencias < ActiveRecord::Migration
  def change
    create_table :preferencias do |t|
      t.references :tipo_habitacion_id
      t.references :huesped_id
      t.integer :numero_almohada_en_cama

      t.timestamps
    end
    add_index :preferencias, :tipo_habitacion_id_id
    add_index :preferencias, :huesped_id_id
  end
end
