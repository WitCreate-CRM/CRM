class Contacto < ActiveRecord::Base
  belongs_to :empresa
  attr_accessible :celular, :email, :fecha_nacimiento, :nombre, :empresa_id

  def self.search(search) 
  	where('nombre like ?', "%#{search}%") 
  end

   validates :nombre, :presence => true, 
   :length => { :minimum => 2 ,:maximum => 200 }

   validates :email, :presence => true, 
   :length => { :maximum => 50 },
   :uniqueness => true,
   :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

   validates :celular, :presence => true, 
   :length => { :maximum => 15 }

end
