class TiposdehabitacionPdf < Prawn::Document
  def initialize(tiposdehabitacion, view)
    super()
    @tiposdehabitacion = tiposdehabitacion
    @view = view
    logo
    tiposdehabitacion_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Tipo De Habitación", :at => [220, 675], size: 22
  end


  def tiposdehabitacion_details    
  	move_down 60
    id = @tiposdehabitacion.id
    descripcion = @tiposdehabitacion.descripcion
    habitacion_tina = @tiposdehabitacion.habitacion_tina
    piso = @tiposdehabitacion.piso
    
  	table ([["Id",  "#{id} "] ,
    ["Descripción", "#{descripcion} "],
    ["Habitación Con Tina", "#{habitacion_tina} "],
    ["Piso", "#{piso} "],
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end