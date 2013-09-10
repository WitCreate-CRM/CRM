class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :extension
      t.string :celular
      t.string :email
      t.string :fecha_nacimiento
      t.references :empresa

      t.timestamps
    end
    add_index :contactos, :empresa_id
  end
end
