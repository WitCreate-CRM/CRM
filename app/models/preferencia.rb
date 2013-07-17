class Preferencia < ActiveRecord::Base
  belongs_to :tiposdehabitacion
  belongs_to :huesped
  belongs_to :cortesia
  attr_accessible :cortesia_id, :huesped_id, :tiposdehabitacion_id

  def self.search(search) 
 		where('tiposdehabitacion_id > ? OR huesped_id > ? OR cortesia_id > ?', "0", "0", "0" ) 
  end


end
