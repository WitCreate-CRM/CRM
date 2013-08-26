class CreateVisitas < ActiveRecord::Migration
  def change
    create_table :visitas do |t|
      t.string :obsequio
      t.references :empleado
      t.references :empresa
      t.text :comentarios
      t.date :created_at

      t.timestamps
    end
    add_index :visitas, :empleado_id
    add_index :visitas, :empresa_id
  end
end
