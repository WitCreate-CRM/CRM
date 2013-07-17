class CreatePreferencias < ActiveRecord::Migration
  def change
    create_table :preferencias do |t|
      t.references :tiposdehabitacion
      t.references :huesped
      t.references :cortesia

      t.timestamps
    end
    add_index :preferencias, :tiposdehabitacion_id
    add_index :preferencias, :huesped_id
    add_index :preferencias, :cortesia_id
  end
end
