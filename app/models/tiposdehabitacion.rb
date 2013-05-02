class Tiposdehabitacion < ActiveRecord::Base
  attr_accessible :descripcion, :habitacion_tina, :piso

  validates :descripcion, :presence => true,
   :length => { :maximum => 30 }

  validates :piso, :presence => true,
   :length => { :maximum => 2 }

end
