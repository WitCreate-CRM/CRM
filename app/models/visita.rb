class Visita < ActiveRecord::Base
  belongs_to :obsequio
  belongs_to :empleado
  belongs_to :empresa
  attr_accessible :comentarios, :fecha, :obsequio_id, :empleado_id, :empresa_id
end
