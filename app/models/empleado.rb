class Empleado < ActiveRecord::Base
  belongs_to :cargo_id
  belongs_to :tipo_identificacion_id
  belongs_to :departamento_id
  attr_accessible :documento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre
end
