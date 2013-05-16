class Telefono < ActiveRecord::Base
  belongs_to :propietario
  attr_accessible :numero_telefonico, :propietario_id

  def self.search(search) 
 where('numero_telefonico like ?', "%#{search}%") 
 end
end
