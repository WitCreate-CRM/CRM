class Alimento < ActiveRecord::Base

  has_many :cortesias

  attr_accessible :descripcion

  def self.search(search) 
 		where('descripcion like ? ', "%#{search}%" ) 
  end

  validates :descripcion, :presence => true, 
   :length => { :maximum => 300 }

end
