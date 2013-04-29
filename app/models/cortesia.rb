class Cortesia < ActiveRecord::Base
  belongs_to :huesped_id
  belongs_to :alimento_id
  attr_accessible :botella_de_vino, :otro_regalo, :tabla_de_queso
end
