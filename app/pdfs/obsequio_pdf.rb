class ObsequioPdf < Prawn::Document



	def initialize(obsequio, view)
		super()
		@obsequio = obsequio
		@view = view
		logo
		deliver_details
		obsequio_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Obsequio Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "Obsequio Id:
		#{@obsequio.id}", :size => 13		
		move_down 20
		text "Descripcion:
		#{@obsequio.descripcion} ", :size => 13
		
		

	end



	def obsequio_details

		move_down 60
		id = @obsequio.id
		descripcion = @obsequio.descripcion 
		
		
		table ([["Obsequio No", "#{id} "] ,
		
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