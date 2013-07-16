class CreateCortesias < ActiveRecord::Migration
  def change
    create_table :cortesias do |t|
      t.references :huesped
      t.string :fecha
      t.text :tipo_de_cortesia

      t.timestamps
    end
    add_index :cortesias, :huesped_id
  end
end
