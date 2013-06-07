class Cargo < ActiveRecord::Base
  attr_accessible :descripcion

  def self.search(search) 
 		where('descripcion like ? ', "%#{search}%" ) 
  end

  validates :descripcion, :presence => true,
  :length => { :minimum => 5, :maximum => 15 }

end
