class Contacto < ActiveRecord::Base
  belongs_to :empresa_id
  attr_accessible :celular, :email, :fecha_nacimiento, :nombre
end
