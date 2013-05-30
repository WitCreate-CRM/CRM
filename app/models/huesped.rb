class Huesped < ActiveRecord::Base
  has_many :telefonos
  has_many :cortesias
  has_many :preferencias
  has_many :sugerenciasyquejas

  belongs_to :tiposdeidentificacion
  belongs_to :empleado_encargado
  attr_accessible :direccion, :documento, :email, :fecha_nacimiento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre, :empleado_encargado_id, :tiposdeidentificacion_id, :avatar

  def self.search(search) 
    where('direccion like ? OR documento like ? OR email like ? OR primer_nombre like ? OR segundo_nombre like ? OR primer_apellido like ? OR segundo_apellido like ? ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" ) 
  end

has_attached_file :avatar,
    :styles => {
      :thumb => "75x75#",
      :small => "100x100#",
      :medium => "150x150>"
    },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  validates :direccion, :presence => true, 
   :length => { :maximum => 25 }

  validates :documento, :presence => true, 
   :length => { :minimum => 10, :maximum => 13 }

  validates :email, :presence => true, 
   :length => { :maximum => 50 },
   :uniqueness => true,
   :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :primer_nombre, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }
 

  validates :primer_apellido, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }

end
