class CreateCortesias < ActiveRecord::Migration
  def change
    create_table :cortesias do |t|
      t.references :huesped_id
      t.string :tabla_de_queso
      t.string :botella_de_vino
      t.references :alimento_id
      t.string :otro_regalo

      t.timestamps
    end
    add_index :cortesias, :huesped_id_id
    add_index :cortesias, :alimento_id_id
  end
end
