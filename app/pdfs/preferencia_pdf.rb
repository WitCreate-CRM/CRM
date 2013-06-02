class PreferenciaPdf < Prawn::Document
  def initialize(preferencia, view)
    super()
    @preferencia = preferencia
    @view = view
    logo
    preferencia_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Preferencia", :at => [220, 675], size: 22
  end


  def preferencia_details    
  	move_down 60
    id = @preferencia.id
    tiposdehabitacion_id = @preferencia.tiposdehabitacion_id
    numero_almohada_en_cama = @preferencia.numero_almohada_en_cama
    
  	table ([["Id",  "#{id} "] ,
    ["Tipo De Habitación", "#{tiposdehabitacion_id} "],
    ["Número De Almohadas En La Cama", "#{numero_almohada_en_cama} "],
    
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end