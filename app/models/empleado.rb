class Empleado < ActiveRecord::Base

  has_many :huespedes
  has_many :visitas
  has_many :telefonos1

  belongs_to :cargo
  belongs_to :tiposdeidentificacion
  belongs_to :departamento
  attr_accessible :avatar ,:documento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre, :cargo_id, :tiposdeidentificacion_id, :departamento_id

  def self.search(search) 
  where('primer_nombre like ? OR segundo_nombre like ? OR primer_apellido like ? OR segundo_apellido like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" ) 
  end

  has_attached_file :avatar,
    :styles => {
      :thumb => "75x75#",
      :small => "100x100#",
      :medium => "150x150>"
    },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

   validates :documento, :presence => true, 
   :length => { :minimum => 10, :maximum => 13 }


  validates :primer_nombre, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }
 

  validates :primer_apellido, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }

end

