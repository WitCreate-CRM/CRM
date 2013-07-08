# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tiposdeidentificaciones = Tiposdeidentificacion.create([{descripcion: 'Cédula de ciudadania', sigla: 'C.C'}, {descripcion: 'Cédula extranjera', sigla: 'C.E'}, {descripcion: 'Tarjeta de identidad', sigla: 'T.I'}, {descripcion: 'Pasaporte', sigla: 'P.S'}])

users = User.create([{email: 'blsm@misena.edu.co', password: 'cuy', password_confirmation: 'cuy', username: 'blsm'}])

tiposdehabitaciones = Tiposdehabitacion.create([{nombre: 'Suite', descripcion: 'Habitación con tina, cama para dos personas y con encamareras', piso: '4', numero_de_habitacion: '305'}, {nombre: 'Sencilla', descripcion: 'Habitación con cama simple sin encamareras', piso: '2', numero_de_habitacion: '278'}])

empleados = Empleado.create([{cargo_id: '2', primer_nombre: 'Juan', segundo_nombre: 'Elber' ,primer_apellido: 'Gomez' ,segundo_apellido: 'Torba' ,tiposdeidentificacion_id: '1' ,documento: '10365674567' ,departamento_id: '1'}])

cargos = Cargo.create([{descripcion: 'Gerente'}, {descripcion: 'Mercadista'}])

departamentos = Departamento.create([{nombre: 'Mercadeo'}, {nombre: 'Calidad'}])