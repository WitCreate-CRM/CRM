class AddAvatarToContactos < ActiveRecord::Migration
  def self.up

	    add_attachment :contactos, :avatar
	 end


	def self.down

		remove_attachment :contactos, :avatar
	end
end
