class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :nit
      t.string :direccion

      t.timestamps
    end
  end
end
