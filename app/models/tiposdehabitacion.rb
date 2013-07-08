class Tiposdehabitacion < ActiveRecord::Base
	
  attr_accessible :descripcion, :nombre, :piso, :numero_de_habitacion

  def self.search(search) 
 		where('descripcion like ? ', "%#{search}%" ) 
  end

  validates :descripcion, :presence => true,
   :length => { :maximum => 30 }

  validates :piso, :presence => true,
   :length => { :maximum => 2 }

  validates :nombre, :presence => true,
   :length => { :minimum => 4, :maximum => 10 }

  validates :numero_de_habitacion, :presence => true,
   :length => { :minimum => 2, :maximum => 5 }

end
