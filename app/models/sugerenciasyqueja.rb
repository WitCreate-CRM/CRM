class Sugerenciasyqueja < ActiveRecord::Base
  belongs_to :huesped 
  belongs_to :tiposdehabitacion
  attr_accessible :comentarios_ultima_visita, :huesped_id ,:huesped_primer_nombre, :tiposdehabitacion_id, :ultima_cortesia

  def huesped_primer_nombre
    huesped.primer_nombre if huesped
  end
 
  def huesped_primer_nombre=(primer_nombre)
    self.huesped = Huesped.find_or_create_by_primer_nombre(primer_nombre) unless primer_nombre.blank? 
  end


  def self.search(search) 
 		where('comentarios_ultima_visita like ? ', "%#{search}%" ) 
  end

  validates :tiposdehabitacion, :presence => true
   

  validates :comentarios_ultima_visita, :presence => true,
   :length => { :maximum => 2500 }

  validates :ultima_cortesia, :presence => true,
   :length => { :maximum => 200 }

end
