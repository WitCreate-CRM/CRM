class Sugerenciasyqueja < ActiveRecord::Base
  belongs_to :huesped
  attr_accessible :observaciones, :problemas_en_la_estadia, :sugerencias, :huesped_id

  validates :observaciones, :presence => true,
   :length => { :maximum => 2500 }

  validates :problemas_en_la_estadia, :presence => true,
   :length => { :maximum => 2500 }

  validates :sugerencias, :presence => true,
   :length => { :maximum => 2500 }

end
