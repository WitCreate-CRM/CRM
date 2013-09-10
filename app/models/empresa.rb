class Empresa < ActiveRecord::Base
	
  has_many :contactos
  belongs_to :empleado
  belongs_to :zona
  attr_accessible :direccion, :nit, :nombre, :telefono, :zona_id

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
