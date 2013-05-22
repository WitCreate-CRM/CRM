class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.references :propietario
      t.string :numero_telefonico

      t.timestamps
    end
    add_index :telefonos, :propietario_id
  end
end
