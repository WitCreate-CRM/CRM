class ContactoPdf < Prawn::Document



	def initialize(contacto, view)
		super()
		@contacto = contacto
		@view = view
		logo
		deliver_details
		contacto_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Contacto Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "Contacto Id:
		#{@contacto.id}", :size => 13		
		move_down 20
		text "Empresa:
		#{@contacto.empresa_id} ", :size => 13
		move_down 20
		text "Nombre:
		#{@contacto.nombre} ", :size => 13
		move_down 20
		text "Celular:
		#{@contacto.celular} ", :size => 13
		move_down 20
		text "Email:
		#{@contacto.email} ", :size => 13
		move_down 20
		text "Fecha de Nacimiento:
		#{@contacto.fecha_nacimiento} ", :size => 13

	end



	def contacto_details

		move_down 60
		id = @contacto.id
		empresa = @contacto.empresa_id 
		nombre = @contacto.nombre
		celular= @contacto.celular
		email = @contacto.email
		fecha_nacimiento = @contacto.fecha_nacimiento
		table ([["Contacto No", "#{id} "] ,
		
		["Empresa", "#{empresa} "],
		["Nombre", "#{nombre} "],
		["Celular", "#{celular}"],
		["Email", "#{email}"],
		["fecha de nacimiento", "#{fecha_nacimiento}"]]),
		:width => 500 do
	    columns(1).align = :center
	    self.header = true
	    self.column_widths = {0 => 200, 3 => 100}
	    columns(2).font_style = :bold
	   end
   end
end