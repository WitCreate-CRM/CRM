class Empleado < ActiveRecord::Base

  has_many :visitas
  has_many :empresas

  belongs_to :cargo
  belongs_to :tiposdeidentificacion
  belongs_to :departamento
  attr_accessible :codigo, :apellido, :avatar ,:documento, :primer_nombre, :segundo_nombre, :cargo_id, :tiposdeidentificacion_id, :departamento_id, :fecha_nacimiento

  def self.search(search) 
  where('primer_nombre like ? OR segundo_nombre like ? ', "%#{search}%", "%#{search}%" ) 
  end

  has_attached_file :avatar,
    :styles => {
      :thumb => "75x75#",
      :small => "100x100#",
      :medium => "150x150>"
    },
    :default_url => 'im.png',
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => '/system/:attachment/:id/:style/:filename'



  validates :primer_nombre, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }
 

  validates :apellido, :presence => true,
   :length => { :minimum => 2, :maximum => 15 }

end

