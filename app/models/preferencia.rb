class Preferencia < ActiveRecord::Base
  belongs_to :tiposdehabitacion
  belongs_to :huesped
  attr_accessible :huesped_id, :tiposdehabitacion_id

  def self.search(search) 
 		where('tiposdehabitacion_id > ? ', "0" ) 
  end


end
