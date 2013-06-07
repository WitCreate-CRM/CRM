class Empresa < ActiveRecord::Base
  attr_accessible :direccion, :nit, :nombre

 def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end

validates :direccion, :presence => true, 
:length => { :maximum => 25 }

validates :nit, :presence => true, 
:length => { :maximum => 5 }

validates :nombre, :presence => true, 
:length => { :maximum => 30 }

end
