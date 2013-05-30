class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.references :huesped
      t.references :empleado
      t.string :numero_telefonico

      t.timestamps
    end
    add_index :telefonos, :huesped_id
    add_index :telefonos, :empleado_id
  end
end
