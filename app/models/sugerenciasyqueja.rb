class Sugerenciasyqueja < ActiveRecord::Base
  belongs_to :huesped
  attr_accessible :observaciones, :problemas_en_la_estadia, :sugerencias, :huesped_id

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
