class CargoPdf < Prawn::Document



	def initialize(cargo, view)
		super()
		@cargo = cargo
		@view = view
		logo
		deliver_details
		cargo_details
	end



	def logo
		logopath = "#{Rails.root}/app/assets/images/crm.png"
		image logopath, :width => 150, :height => 70
		move_down 10
		draw_text "Cargo Details", :at => [220, 675], size: 22

	end



	def deliver_details
		move_down 60
		text "cargo Id:
		#{@cargo.id}", :size => 13		
		move_down 20
		text "Descripcion:
		#{@cargo.descripcion} ", :size => 13
		

	end



	def cargo_details

		move_down 60
		id = @cargo.id
		descripcion = @cargo.descripcion 
		
		table ([["Cargo No", "#{id} "] ,
		
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