class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.references :huesped
      t.string :numero_telefonico

      t.timestamps
    end
    add_index :telefonos, :huesped_id
  end
end
