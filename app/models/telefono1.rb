class Telefono1 < ActiveRecord::Base
  belongs_to :empleado
  attr_accessible :numero_telefonico

  def self.search(search) 
 	where('numero_telefonico like ?', "%#{search}%") 
  end

end
