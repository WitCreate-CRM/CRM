class CreateSugerenciasyquejas < ActiveRecord::Migration
  def change
    create_table :sugerenciasyquejas do |t|
      t.references :huesped
      t.text :comentarios_ultima_visita

      t.timestamps
    end
    add_index :sugerenciasyquejas, :huesped_id
  end
end
