class CortesiaPdf < Prawn::Document
  def initialize(cortesia, view)
    super()
    @cortesia = cortesia
    @view = view
    logo
    deliver_details
    cortesia_details
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/crm.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Cortesia", :at => [220, 675], size: 22
  end

  def deliver_details
    move_down 60
    text "Cortesia Id:
   #{@cortesia.id} ", :size => 13
    move_down 20
    text "Huésped:
   #{@cortesia.huesped_id} ", :size => 13
     move_down 20
    text "Botella De Vino:
   #{@cortesia.botella_de_vino} ", :size => 13
    move_down 20
    text "Otro Regalo:
   #{@cortesia.otro_regalo} ", :size => 13
    move_down 20
    text "Tabla De Queso:
   #{@cortesia.tabla_de_queso} ", :size => 13
    move_down 20
    text "Alimento:
   #{@cortesia.alimento_id} ", :size => 13
  end

  def cortesia_details    
  	move_down 60
    id = @cortesia.id
    huesped_id = @cortesia.huesped_id
    botella_de_vino = @cortesia.botella_de_vino
    otro_regalo = @cortesia.otro_regalo
    tabla_de_queso = @cortesia.tabla_de_queso
    alimento_id = @cortesia.alimento_id
    
  	table ([["Id",  "#{id} "] ,
    ["Huésped", "#{huesped_id} "],
    ["Botella De Vino", "#{botella_de_vino} "],
    ["Otro Regalo", "#{otro_regalo} "],
    ["Tabla De Queso", "#{tabla_de_queso} "],
    ["Alimento", "#{alimento_id} "]
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end