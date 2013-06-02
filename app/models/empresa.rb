class Empresa < ActiveRecord::Base
  attr_accessible :direccion, :nit, :nombre

 def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end
end
