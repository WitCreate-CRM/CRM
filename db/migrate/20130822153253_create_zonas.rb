class CreateZonas < ActiveRecord::Migration
  def change
    create_table :zonas do |t|
      t.string :codigo
      t.string :lugar

      t.timestamps
    end
  end
end
