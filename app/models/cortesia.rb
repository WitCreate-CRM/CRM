class Cortesia < ActiveRecord::Base
  belongs_to :huesped
  belongs_to :alimento
  attr_accessible :botella_de_vino, :otro_regalo, :tabla_de_queso, :huesped_id, :alimento_descripcion

  def alimento_descripcion
    alimento.descripcion if alimento
  end
 
  def alimento_descripcion=(descripcion)
    self.alimento = Alimento.find_or_create_by_descripcion(descripcion) unless descripcion.blank? 
  end


  def self.search(search) 
 		where('botella_de_vino like ? OR otro_regalo like ? OR tabla_de_queso like ?', "%#{search}%", "%#{search}%", "%#{search}%" ) 
  end


  validates :otro_regalo, :presence => true, 
   :length => { :maximum => 100 }

  validates :tabla_de_queso, :presence => true, 
   :length => { :maximum => 40 }

end
