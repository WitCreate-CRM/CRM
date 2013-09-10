class Tiposdehabitacion < ActiveRecord::Base
  has_many :sugerenciasyquejas
  attr_accessible  :tipo, 

  def self.search(search) 
 		where('tipo like ? ', "%#{search}%" ) 
  end

  
  validates :tipo, :presence => true,
   :length => { :minimum => 4, :maximum => 20}

  
end
