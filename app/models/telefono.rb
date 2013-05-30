class Telefono < ActiveRecord::Base
  belongs_to :empleado
  attr_accessible :numero_telefonico, :empleado_id

  def self.search(search) 
 where('numero_telefonico like ?', "%#{search}%") 
 end
end
