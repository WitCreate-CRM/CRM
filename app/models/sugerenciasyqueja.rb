class Sugerenciasyqueja < ActiveRecord::Base
  belongs_to :huesped_id
  attr_accessible :observaciones, :problemas_en_la_estadia, :sugerencias
end
