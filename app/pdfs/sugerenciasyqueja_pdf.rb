class SugerenciasyquejaPdf < Prawn::Document
  def initialize(sugerenciasyqueja, view)
    super()
    @sugerenciasyqueja = sugerenciasyqueja
    @view = view
    logo
    sugerenciasyqueja_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Sugerencia / Queja", :at => [220, 675], size: 22
  end


  def sugerenciasyqueja_details    
  	move_down 60
    id = @sugerenciasyqueja.id
    huesped_id = @sugerenciasyqueja.huesped_id
    observaciones = @sugerenciasyqueja.observaciones
    problemas_en_la_estadia = @sugerenciasyqueja.problemas_en_la_estadia
    sugerencias = @sugerenciasyqueja.sugerencias
    
  	table ([["Id",  "#{id} "] ,
    ["Huésped", "#{huesped_id} "],
    ["Observaciones", "#{observaciones} "],
    ["Problemas En La Estadia", "#{problemas_en_la_estadia} "],
    ["Sugerencias", "#{sugerencias} "],
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end