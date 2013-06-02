class Telefono < ActiveRecord::Base
  belongs_to :huesped
  attr_accessible :numero_telefonico, :propietario_id

  def self.search(search) 
 where('numero_telefonico like ?', "%#{search}%") 
 end
end
