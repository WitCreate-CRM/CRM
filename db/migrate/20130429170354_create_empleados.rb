class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.references :cargo
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.references :tiposdeidentificacion
      t.string :documento
      t.references :departamento

      t.timestamps
    end
    add_index :empleados, :cargo_id
    add_index :empleados, :tiposdeidentificacion_id
    add_index :empleados, :departamento_id
  end
end
