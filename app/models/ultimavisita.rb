class Ultimavisita < ActiveRecord::Base
	belongs_to :visita
  attr_accessible :comentario, :contacto, :fecha, :obsequio, :pendiente, :telefono, :visita_id,
  
  def self.search(contact, fecha, fech_ini, fech_fin)
  	   	if contact == ""
           where('fecha = ?', fecha) 
       	elsif !(fech_ini.blank? and fech_fin.blank?) 
        	where('created_at >= ? and created_at <= ?', "#{fech_ini}","#{fech_fin}" )
    	else
           where('upper(contacto) like ?', "%#{contact}%".upcase)
       	end
   end
  
end
