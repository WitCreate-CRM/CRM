class Preferencia < ActiveRecord::Base
  belongs_to :tipo_habitacion_id
  belongs_to :huesped_id
  attr_accessible :numero_almohada_en_cama
end
