class Telefono < ActiveRecord::Base
  belongs_to :propietario_id
  attr_accessible :numero_telefonico
end
