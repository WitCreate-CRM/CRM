class VisitaPdf < Prawn::Document



	def initialize(visita, view)
		super()
		@visita = visita
		@view = view
		logo
		deliver_details
		visita_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Visita Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "visita Id:
		#{@visita.id}", :size => 13		
		move_down 20
		text "Obsequio:
		#{@visita.obsequio_id} ", :size => 13
		move_down 20
		text "Empleado:
		#{@visita.empleado_id} ", :size => 13
		move_down 20
		text "Empresa:
		#{@visita.empresa_id} ", :size => 13
		move_down 20
		text "Fecha:
		#{@visita.fecha} ", :size => 13
		move_down 20
		text "Comentarios de visita:
		#{@visita.comentarios} ", :size => 13

	end



	def visita_details

		move_down 60
		id = @visita.id
		obsequio = @visita.obsequio_id 
		empleado = @visita.empleado_id
		empresa= @visita.empresa_id
		fecha = @visita.fecha
		comentario = @visita.comentarios
		table ([["Visita No", "#{id} "] ,
		
		["Obsequio", "#{obsequio_id} "],
		["Empleado", "#{empleado_id} "],
		["Empresa", "#{empresa_id}"],
		["Fecha", "#{fecha}"],
		["Comentarios", "#{comentarios}"]]),
		:width => 500 do
	    columns(1).align = :center
	    self.header = true
	    self.column_widths = {0 => 200, 3 => 100}
	    columns(2).font_style = :bold
	   end
   end
end