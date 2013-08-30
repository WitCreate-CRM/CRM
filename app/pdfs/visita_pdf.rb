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
		#{@visita.obsequio} ", :size => 13
		move_down 20
		text "Empleado:
		#{@visita.empleado.primer_nombre} ", :size => 13
		move_down 20
		text "Empresa:
		#{@visita.empresa.nombre} ", :size => 13
		move_down 20
		text "Fecha:
		#{@visita.created_at} ", :size => 13
		move_down 20
		text "Comentarios de visita:
		#{@visita.comentarios} ", :size => 13

	end



	def visita_details

		move_down 60
		id = @visita.id
		obsequio_id = @visita.obsequio
		empleado_id = @visita.empleado.primer_nombre
		empresa_id = @visita.empresa.nombre
		fecha = @visita.created_at
		comentarios = @visita.comentarios
		table ([["Visita No", "#{id} "] ,
		
		["Obsequio", "#{obsequio} "],
		["Empleado", "#{empleado.primer_nombre} "],
		["Empresa", "#{empresa.nombre}"],
		["Fecha", "#{created_at}"],
		["Comentarios", "#{comentarios}"]]),
		:width => 500 do
	    columns(1).align = :center
	    self.header = true
	    self.column_widths = {0 => 200, 3 => 100}
	    columns(2).font_style = :bold
	   end
   end
end