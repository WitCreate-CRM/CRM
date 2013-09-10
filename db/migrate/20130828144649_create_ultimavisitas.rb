class CreateUltimavisitas < ActiveRecord::Migration
  def change
    create_table :ultimavisitas do |t|
      t.date :fecha
      t.string :contacto
      t.string :telefono
      t.string :obsequio
      t.text :comentario
      t.text :pendiente
      t.references :visita

      t.timestamps
    end
    add_index :ultimavisitas, :visita_id
  end
end
