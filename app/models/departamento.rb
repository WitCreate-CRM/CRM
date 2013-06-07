class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  
 def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end

 validates :nombre, :presence => true,
 :length => { :minimum => 4, :maximum => 15 }

end
