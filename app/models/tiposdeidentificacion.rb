class Tiposdeidentificacion < ActiveRecord::Base
  attr_accessible :descripcion, :sigla

  validates :descripcion, :presence => true,
   :length => { :minimum => 6, :maximum => 20 }

  validates :sigla, :presence => true,
   :length => { :minimum => 2, :maximum => 3 }

end