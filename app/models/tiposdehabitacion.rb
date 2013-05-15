class Tiposdehabitacion < ActiveRecord::Base
  attr_accessible :descripcion, :habitacion_tina, :piso

  def self.search(search) 
 		where('descripcion like ? ', "%#{search}%" ) 
  end

  validates :descripcion, :presence => true,
   :length => { :maximum => 30 }

  validates :piso, :presence => true,
   :length => { :maximum => 2 }

end
