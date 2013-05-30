class AddAvatarToEmpleados < ActiveRecord::Migration

	  def self.up
	  	add_attachment :empleados, :avatar
	  end

	def self.down
      remove_attachment :empleados, :avatar
    end
end
