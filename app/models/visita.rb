class Visita < ActiveRecord::Base
  belongs_to :obsequio
  belongs_to :empleado
  belongs_to :empresa
  attr_accessible :comentarios, :fecha, :obsequio_id, :empleado_id, :empresa_id

 def self.search(search) 
 where('comentarios like ?', "%#{search}%") 
 end

end

