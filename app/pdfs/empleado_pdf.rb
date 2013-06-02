class EmpleadoPdf < Prawn::Document



	def initialize(empleado, view)
		super()
		@empleado = empleado
		@view = view
		logo
		deliver_details
		empleado_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Empleado Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "Empleado Id:
		#{@empleado.id}", :size => 13		
		move_down 20
		text "Cargo:
		#{@empleado.cargo_id} ", :size => 13
		move_down 20
		text "Primer Nombre:
		#{@empleado.primer_nombre} ", :size => 13
		move_down 20
		text "Segundo Nombre:
		#{@empleado.segundo_nombre} ", :size => 13
		move_down 20
		text "Primer Apellido:
		#{@empleado.primer_apellido} ", :size => 13
		move_down 20
		text "Segundo Apellido:
		#{@empleado.segundo_apellido} ", :size => 13
		move_down 20
		text "Tipo De Identificacion:
		#{@empleado.tipo_identificacion_id} ", :size => 13
		move_down 20
		text "Documento:
		#{@empleado.documento} ", :size => 13
		move_down 20
		text "Departamento:
		#{@empleado.departamento_id} ", :size => 13

	end



	def empleado_details

		move_down 60
		id = @empleado.id
		cargo_id = @empleado.cargo_id 
		primer_nombre = @empleado.primer_nombre
		segundo_nombre= @empleado.segundo_nombre
		primer_apellido = @empleado.primer_nombre
		segundo_apellido = @empleado.segundo_apellido
		tipo_identificacion_id = @empleado.tipo_identificacion_id
		documento = @empleado.documento
		departamento_id = @empleado.departamento_id



		table ([["Empleado No", "#{id} "] ,
		
		["Cargo", "#{cargo_id} "],
		["Primer Nombre", "#{primer_nombre} "],
		["Segundo Nombre", "#{segundo_nombre}"],
		["Primer Apellido", "#{primer_apellido}"],
		["Segundo Nombre", "#{segundo_apellido}"],
		["Tipo De Identificacion", "#{tipo_identificacion_id} "],
		["Documento", "#{documento} "],
		["Departamento", "#{departamento_id} "],
		
		]),
		:width => 500 do
	    columns(1).align = :center
	    self.header = true
	    self.column_widths = {0 => 200, 3 => 100}
	    columns(2).font_style = :bold
	   end
   end
end