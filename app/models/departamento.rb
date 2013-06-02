class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  
 def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end

end
