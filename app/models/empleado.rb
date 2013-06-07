class Empleado < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :tipo_identificacion
  belongs_to :departamento
  attr_accessible :documento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre, :cargo_id, :tipo_identificacion_id, :departamento_id

  def self.search(search) 
  where('primer_nombre like ? OR segundo_nombre like ? OR primer_apellido like ? OR segundo_apellido like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" ) 
  end

   validates :documento, :presence => true, 
   :length => { :minimum => 10, :maximum => 13 }


  validates :primer_nombre, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }
 

  validates :primer_apellido, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }

end

