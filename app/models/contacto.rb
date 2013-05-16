class Contacto < ActiveRecord::Base
  belongs_to :empresa
  attr_accessible :celular, :email, :fecha_nacimiento, :nombre, :empresa_id

  def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end
end
