class VisitaPdf < Prawn::Document



	def initialize(visita, view)
		super()
		@visita = visita
		@view = view
		logo
		visita_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Visita Details", :at => [220, 675], size: 22

	end


	def visita_details

		move_down 60
		id = @visita.id
		obsequio = @visita.obsequio
		empleado_id = @visita.empleado.primer_nombre
		empresa_id = @visita.empresa.nombre
		created_at = @visita.created_at
		comentarios = @visita.comentarios
		table ([["Visita N°", "#{id} "] ,
		
		["Obsequio", "#{obsequio} "],
		["Empleado", "#{empleado_id} "],
		["Empresa", "#{empresa_id}"],
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