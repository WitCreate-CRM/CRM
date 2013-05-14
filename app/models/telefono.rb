class Telefono < ActiveRecord::Base
  belongs_to :propietario
  attr_accessible :numero_telefonico, :propietario_id
end
