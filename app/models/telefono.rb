class Telefono < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :empleado
  attr_accessible :numero_telefonico, :empleado_id
=======
  belongs_to :huesped
  attr_accessible :numero_telefonico, :propietario_id
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b

  def self.search(search) 
 where('numero_telefonico like ?', "%#{search}%") 
 end
end
