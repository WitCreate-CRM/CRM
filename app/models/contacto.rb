class Contacto < ActiveRecord::Base
  belongs_to :empresa
  attr_accessible :celular, :email, :fecha_nacimiento, :nombre, :empresa_id, :avatar

  def self.search(search) 
  where('nombre like ?', "%#{search}%") 
 end

   has_attached_file :avatar, :styles => { :small => "150x150>",:lsmall => "30x30>" },
                  :url  => "/assets/:attachment/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/:attachment/:id/:style/:basename.:extension"

   validates_attachment_presence :avatar
   validates_attachment_size :avatar, :less_than => 5.megabytes
   validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg' ]

end
