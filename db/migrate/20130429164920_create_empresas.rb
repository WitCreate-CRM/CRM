class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :nit
      t.string :direccion
      t.references :empleado
      t.string :telefono

      t.timestamps
    end

    add_index :empresas, :empleado_id

  end
end
