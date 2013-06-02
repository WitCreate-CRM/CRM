class CreateTiposdeidentificaciones < ActiveRecord::Migration
  def change
    create_table :tiposdeidentificaciones do |t|
      t.string :descripcion
      t.string :sigla

      t.timestamps
    end
  end
end
