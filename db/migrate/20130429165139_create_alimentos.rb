class CreateAlimentos < ActiveRecord::Migration
  def change
    create_table :alimentos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
