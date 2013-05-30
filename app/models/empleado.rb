class Empleado < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :tiposdeidentificacion
  belongs_to :departamento
  attr_accessible :documento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre, :cargo_id, :tiposdeidentificacion_id, :departamento_id, :avatar
  has_many :telefonos
  
  def self.search(search) 
  where('primer_nombre like ? OR segundo_nombre like ? OR primer_apellido like ? OR segundo_apellido like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" ) 
  end
has_attached_file :avatar, :styles => { :small => "150x150>", :lsmall => "30x30>" },
                  :url  => "/assets/:attachment/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/:attachment/:id/:style/:basename.:extension"

   validates_attachment_presence :avatar
   validates_attachment_size :avatar, :less_than => 5.megabytes
   validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg' ]
end

