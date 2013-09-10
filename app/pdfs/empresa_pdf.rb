class EmpresaPdf < Prawn::Document



	def initialize(empresa, view)
		super()
		@empresa = empresa
		@view = view
		logo
		deliver_details
		empresa_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Empresa Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "Empresa Id:
		#{@empresa.id}", :size => 13		
		move_down 20
		text "Nombre:
		#{@empresa.nombre} ", :size => 13
		move_down 20
		text "Nit:
		#{@empresa.nit} ", :size => 13
		move_down 20
		text "Direccion:
		#{@empresa.direccion} ", :size => 13
		move_down 20
		text "Zona:
		#{@empresa.zona.lugar} ", :size => 13

	end



	def empresa_details

		move_down 60
		id = @empresa.id
		nombre = @empresa.nombre 
		nit = @empresa.nit
		direccion= @empresa.direccion
		zona= @empresa.zona.lugar
		
		table ([["Empresa No", "#{id} "] ,
		
		["Nombre", "#{nombre} "],
		["Nit", "#{nit} "],
		["Direccion", "#{direccion}"],
		["Zona", "#{zona}"],
		
		]),
		:width => 500 do
	    columns(1).align = :center
	    self.header = true
	    self.column_widths = {0 => 200, 3 => 100}
	    columns(2).font_style = :bold
	   end
   end
end