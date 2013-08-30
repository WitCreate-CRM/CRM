class Visita < ActiveRecord::Base
  belongs_to :empleado
  belongs_to :empresa
  attr_accessible :obsequio, :comentarios, :fecha, :empleado_id, :empleado_primer_nombre, :empresa_id, :created_at

  def empleado_primer_nombre
	  empleado.primer_nombre if empleado
  end

  def empleado_primer_nombre=(primer_nombre)
    self.empleado = Empleado.find_or_create_by_primer_nombre(primer_nombre) unless primer_nombre.blank?
  end


 def self.search(search, fech_ini, fech_fin)
    if !(fech_ini.blank? and fech_fin.blank?) 
        where('created_at >= ? and created_at <= ?', "#{fech_ini}","#{fech_fin}" )
    else
        where('comentarios like ? OR obsequio like ?', "%#{search}%", "%#{search}%")
    end 
 end


  validates :comentarios, :presence => true, 
  :length => { :maximum => 200 }

end

