class CreateHuespedes < ActiveRecord::Migration
  def change
    create_table :huespedes do |t|
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.references :tiposdeidentificacion
      t.string :documento
      t.string :fecha_nacimiento
      t.string :direccion
      t.string :email

      t.timestamps
    end
    add_index :huespedes, :tiposdeidentificacion_id
  end
end
