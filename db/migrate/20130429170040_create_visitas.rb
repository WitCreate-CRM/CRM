class CreateVisitas < ActiveRecord::Migration
  def change
    create_table :visitas do |t|
      t.references :obsequio_id
      t.references :empleado_id
      t.references :empresa_id
      t.date :fecha
      t.text :comentarios

      t.timestamps
    end
    add_index :visitas, :obsequio_id_id
    add_index :visitas, :empleado_id_id
    add_index :visitas, :empresa_id_id
  end
end
