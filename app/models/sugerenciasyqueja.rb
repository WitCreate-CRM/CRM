class Sugerenciasyqueja < ActiveRecord::Base
  belongs_to :huesped
  attr_accessible :observaciones, :problemas_en_la_estadia, :sugerencias, :huesped_id ,:huesped_primer_nombre

  def huesped_primer_nombre
    huesped.primer_nombre if huesped
  end
 
  def huesped_primer_nombre=(primer_nombre)
    self.huesped = Huesped.find_or_create_by_primer_nombre(primer_nombre) unless primer_nombre.blank? 
  end


  def self.search(search) 
 		where('observaciones like ? OR problemas_en_la_estadia like ? OR sugerencias like ? ', "%#{search}%", "%#{search}%", "%#{search}%" ) 
  end

  validates :observaciones, :presence => true,
   :length => { :maximum => 2500 }

  validates :problemas_en_la_estadia, :presence => true,
   :length => { :maximum => 2500 }

  validates :sugerencias, :presence => true,
   :length => { :maximum => 2500 }

end
