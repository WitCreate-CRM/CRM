class Cortesia < ActiveRecord::Base
  belongs_to :huesped
  belongs_to :alimento
  attr_accessible :botella_de_vino, :otro_regalo, :tabla_de_queso, :huesped_id, :alimento_id

  validates :botella_de_vino, :presence => true, 
   :length => { :maximum => 50 }

  validates :otro_regalo, :presence => true, 
   :length => { :maximum => 100 }

  validates :tabla_de_queso, :presence => true, 
   :length => { :maximum => 40 }

end
