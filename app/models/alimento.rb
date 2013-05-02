class Alimento < ActiveRecord::Base
  attr_accessible :descripcion

  validates :descripcion, :presence => true, 
   :length => { :maximum => 300 }

end
