class TiposdeidentificacionPdf < Prawn::Document
  def initialize(tiposdeidentificacion, view)
    super()
    @tiposdeidentificacion = tiposdeidentificacion
    @view = view
    logo
    tiposdeidentificacion_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Tipo De Identificación", :at => [220, 675], size: 22
  end


  def tiposdeidentificacion_details    
  	move_down 60
    id = @tiposdeidentificacion.id
    descripcion = @tiposdeidentificacion.descripcion
    sigla = @tiposdeidentificacion.sigla
    
  	table ([["Id",  "#{id} "] ,
    ["Descripción", "#{descripcion} "],
    ["Sigla", "#{sigla} "],
   
    
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end