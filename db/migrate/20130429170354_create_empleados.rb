class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.references :cargo_id
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.references :tipo_identificacion_id
      t.string :documento
      t.references :departamento_id

      t.timestamps
    end
    add_index :empleados, :cargo_id_id
    add_index :empleados, :tipo_identificacion_id_id
    add_index :empleados, :departamento_id_id
  end
end
