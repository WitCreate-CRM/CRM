class Preferencia < ActiveRecord::Base
  belongs_to :tipo_habitacion
  belongs_to :huesped
  attr_accessible :numero_almohada_en_cama, :huesped_id, :tipo_habitacion_id

  def self.search(search) 
 		where('numero_almohada_en_cama != ? ', "0" ) 
  end

  validates :numero_almohada_en_cama, :presence => true, 
   :length => { :maximum => 2 }

end
