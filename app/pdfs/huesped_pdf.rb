class HuespedPdf < Prawn::Document
  def initialize(huesped, view)
    super()
    @huesped = huesped
    @view = view
    logo
    huesped_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Huésped", :at => [220, 675], size: 22
  end


  def huesped_details    
  	move_down 60
    id = @huesped.id
    primer_nombre = @huesped.primer_nombre
    segundo_nombre = @huesped.segundo_nombre
    primer_apellido = @huesped.primer_apellido
    segundo_apellido = @huesped.segundo_apellido
    tipo_identificacion_id = @huesped.tipo_identificacion_id
    documento = @huesped.documento
    fecha_nacimiento = @huesped.fecha_nacimiento
    direccion = @huesped.direccion
    email = @huesped.email
    empleado_encargado_id = @huesped.empleado_encargado_id


  	table ([["Id", "#{id}"],
    ["Primer Nombre", "#{primer_nombre}"],
    ["Segundo Nombre", "#{segundo_nombre}"],
    ["Primer Apellido", "#{primer_apellido}"],
    ["Segundo Apellido", "#{segundo_apellido}"],
    ["Tipo De Identificación", "#{tipo_identificacion_id}"],
    ["Documento", "#{documento}"],
    ["Fecha De Nacimiento", "#{fecha_nacimiento}"],
    ["Dirección", "#{direccion}"],
    ["Email", "#{email}"],
    ["Empleado Encargado", "#{empleado_encargado_id}"],
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(3).font_style = :bold
    end
  end
end