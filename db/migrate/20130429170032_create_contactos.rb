class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.references :empresa
      t.string :nombre
      t.string :celular
      t.string :email
      t.date :fecha_nacimiento

      t.timestamps
    end
    add_index :contactos, :empresa_id
  end
end
