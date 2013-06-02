class CreateSugerenciasyquejas < ActiveRecord::Migration
  def change
    create_table :sugerenciasyquejas do |t|
      t.references :huesped
      t.text :observaciones
      t.text :sugerencias
      t.text :problemas_en_la_estadia

      t.timestamps
    end
    add_index :sugerenciasyquejas, :huesped_id
  end
end
