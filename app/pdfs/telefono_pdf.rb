class TelefonoPdf < Prawn::Document
  def initialize(telefono, view)
    super()
    @telefono = telefono
    @view = view
    logo
    telefono_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Telefono", :at => [220, 675], size: 22
  end


  def telefono_details
  	move_down 60
    id = @telefono.id
    numero_telefonico = @telefono.numero_telefonico
    
    table ([["Telefono", "#{id} "],
    ["numero Telefonico", "#{numero_telefonico} "],
    ]),

	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end