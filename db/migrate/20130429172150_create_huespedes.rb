class CreateHuespedes < ActiveRecord::Migration
  def change
    create_table :huespedes do |t|
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.references :tipo_identificacion
      t.string :documento
      t.date :fecha_nacimiento
      t.string :direccion
      t.string :email
      t.references :empleado_encargado

      t.timestamps
    end
    add_index :huespedes, :tipo_identificacion_id
    add_index :huespedes, :empleado_encargado_id
  end
end
