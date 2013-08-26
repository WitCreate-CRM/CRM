class Visita < ActiveRecord::Base
  belongs_to :empleado
  belongs_to :empresa
  attr_accessible :obsequio, :comentarios, :fecha, :obsequio_id, :obsequio_descripcion, :empleado_id, :empleado_primer_nombre, :empresa_id, :created_at

  def empleado_primer_nombre
	  empleado.primer_nombre if empleado
  end

  def empleado_primer_nombre=(primer_nombre)
    self.empleado = Empleado.find_or_create_by_primer_nombre(primer_nombre) unless primer_nombre.blank?
  end

  def obsequio_descripcion
    obsequio.descripcion if obsequio
  end

  def obsequio_descripcion=(descripcion)
    self.obsequio = Obsequio.find_or_create_by_descripcion(descripcion) unless descripcion.blank?
  end

 def self.search(search)
    where('comentarios like ? OR obsequio like ?', "%#{search}%", "%#{search}%" )
 end

  def self.search2(created_at, created_at2)  
    where('created_at >= ? and created_at <= ?', created_at, created_at2 )
  end



  validates :comentarios, :presence => true, 
  :length => { :maximum => 200 }

end

