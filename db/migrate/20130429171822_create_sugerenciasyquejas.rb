class CreateSugerenciasyquejas < ActiveRecord::Migration
  def change
    create_table :sugerenciasyquejas do |t|
      t.references :huesped_id
      t.text :observaciones
      t.text :sugerencias
      t.text :problemas_en_la_estadia

      t.timestamps
    end
    add_index :sugerenciasyquejas, :huesped_id_id
  end
end
