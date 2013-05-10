class Huesped < ActiveRecord::Base
  belongs_to :tipo_identificacion
  belongs_to :empleado_encargado
  attr_accessible :direccion, :documento, :email, :fecha_nacimiento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre, :empleado_encargado_id, :tipo_identificacion_id

  validates :direccion, :presence => true, 
   :length => { :maximum => 25 }

  validates :documento, :presence => true, 
   :length => { :minimum => 11, :maximum => 13 }

  validates :email, :presence => true, 
   :length => { :maximum => 50 },
   :uniqueness => true,
   :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :primer_nombre, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }
 

  validates :primer_apellido, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }


end
