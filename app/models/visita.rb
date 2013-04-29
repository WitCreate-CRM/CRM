class Visita < ActiveRecord::Base
  belongs_to :obsequio_id
  belongs_to :empleado_id
  belongs_to :empresa_id
  attr_accessible :comentarios, :fecha
end
