class CreateHuespedes < ActiveRecord::Migration
  def change
    create_table :huespedes do |t|
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.references :tiposdeidentificacion
      t.string :documento
      t.date :fecha_nacimiento
      t.string :direccion
      t.string :email
      t.references :empleado

      t.timestamps
    end
    add_index :huespedes, :tiposdeidentificacion_id
    add_index :huespedes, :empleado_id
  end
end
