class CreateObsequios < ActiveRecord::Migration
  def change
    create_table :obsequios do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
