class CreateVisitas < ActiveRecord::Migration
  def change
    create_table :visitas do |t|
      t.references :obsequio
      t.references :empleado
      t.references :empresa
      t.date :fecha
      t.text :comentarios

      t.timestamps
    end
    add_index :visitas, :obsequio_id
    add_index :visitas, :empleado_id
    add_index :visitas, :empresa_id
  end
end
