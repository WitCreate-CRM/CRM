class CreateTelefonos1 < ActiveRecord::Migration
  def change
    create_table :telefonos1 do |t|
      t.references :empleado
      t.string :numero_telefonico

      t.timestamps
    end
    add_index :telefonos1, :empleado_id
  end
end
