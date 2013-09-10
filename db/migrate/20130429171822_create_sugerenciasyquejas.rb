class CreateSugerenciasyquejas < ActiveRecord::Migration
  def change
    create_table :sugerenciasyquejas do |t|
      t.references :huesped
      t.text :comentarios_ultima_visita
      t.references :tiposdehabitacion
      t.text :ultima_cortesia

      t.timestamps
    end
    add_index :sugerenciasyquejas, :huesped_id
    add_index :sugerenciasyquejas, :tiposdehabitacion_id
  end
end
