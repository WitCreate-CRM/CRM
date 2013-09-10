class Ultimavisita < ActiveRecord::Base
	belongs_to :visita
  attr_accessible :comentario, :contacto, :fecha, :obsequio, :pendiente, :telefono, :visita_id,
  
  def self.search(contact, fecha)
  	   if contact == ""
           where('fecha = ?', fecha) 
       else
           where('upper(contacto) like ?', "%#{contact}%".upcase)
       end
   end
  
end

