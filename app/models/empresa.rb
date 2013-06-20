class Empresa < ActiveRecord::Base
	
  has_many :contactos
  belongs_to :empleado
  
  attr_accessible :direccion, :nit, :nombre

 def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end

validates :direccion, :presence => true, 
:length => { :maximum => 25 }

validates :nit, :presence => true, 
:length => { :maximum => 10 }

validates :nombre, :presence => true, 
:length => { :maximum => 30 }

end
