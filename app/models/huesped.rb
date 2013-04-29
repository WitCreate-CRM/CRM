class Huesped < ActiveRecord::Base
  belongs_to :tipo_identificacion_id
  belongs_to :empleado_encargado_id
  attr_accessible :direccion, :documento, :email, :fecha_nacimiento, :primer_apellido, :primer_nombre, :segundo_apellido, :segundo_nombre
end
