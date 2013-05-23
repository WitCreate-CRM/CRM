class AlimentoPdf < Prawn::Document
  def initialize(alimento, view)
    super()
    @alimento = alimento
    @view = view
    logo
    alimento_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Alimento", :at => [220, 675], size: 22
  end


  def alimento_details    
  	move_down 60
    id = @alimento.id
    descripcion = @alimento.descripcion
    
  	table ([["Id",  "#{id} "] ,
    ["Descripcion", "#{descripcion} "],
   
    
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end