class DepartamentoPdf < Prawn::Document



	def initialize(departamento, view)
		super()
		@departamento = departamento
		@view = view
		logo
		deliver_details
		departamento_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Departamento Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "Departamento Id:
		#{@departamento.id}", :size => 13		
		move_down 20
		text "Nombre:
		#{@departamento.nombre} ", :size => 13
		
	end



	def departamento_details

		move_down 60
		id = @departamento.id
		nombre = @departamento.nombre
		
		table ([["Departamento No", "#{id} "] ,
		       ["Nombre", "#{nombre} "],
		]),
		:width => 500 do
	    columns(1).align = :center
	    self.header = true
	    self.column_widths = {0 => 200, 3 => 100}
	    columns(2).font_style = :bold
	   end
   end
end