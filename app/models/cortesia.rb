class Cortesia < ActiveRecord::Base
  belongs_to :huesped
  attr_accessible :tipo_de_cortesia, :fecha, :huesped_id


  def self.search(search) 
 		where('fecha like ? OR tipo_de_cortesia like ?' , "%#{search}%", "%#{search}%" ) 
  end

end
