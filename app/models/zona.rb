class Zona < ActiveRecord::Base
  has_many :zonas
  attr_accessible :codigo, :lugar

  def self.search(search) 
 		where('lugar like ? ', "%#{search}%" ) 
  end
end
 