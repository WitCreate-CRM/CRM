# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tiposdeidentificaciones = Tiposdeidentificacion.create([{descripcion: 'Cédula de ciudadania', sigla: 'C.C'}, {descripcion: 'Cédula extranjera', sigla: 'C.E'}, {descripcion: 'Tarjeta de identidad', sigla: 'T.I'}, {descripcion: 'Pasaporte', sigla: 'P.S'}])

users = User.create([{email: 'blsm@misena.edu.co', password: 'cuy', password_confirmation: 'cuy', username: 'blsm'}, {email: 'alejoh89@msn.com', password: '3742996', password_confirmation: '3742996', username: 'alejandro'}])

<<<<<<< HEAD
empleados = Empleado.create([{:avatar => File.open(File.join(Rails.root, "/public/system/avatares/1/thumb/lennon.png")),codigo: '01', cargo_id:'1', primer_nombre:'Norley', segundo_nombre:'', apellido:'Arenas', tiposdeidentificacion_id:'1', documento:'3203409423', departamento_id:'1'},
	{:avatar => File.open(File.join(Rails.root, "/public/system/avatares/1/thumb/lennon.png")), codigo: '02', cargo_id:'1', primer_nombre:'Astrid', segundo_nombre:'Maria', apellido:'Canchila', tiposdeidentificacion_id:'1', documento:'4335409423', departamento_id:'1'},
	{:avatar => File.open(File.join(Rails.root, "/public/system/avatares/1/thumb/lennon.png")),codigo: '01', cargo_id:'1', primer_nombre:'Carolina', segundo_nombre:'', apellido:'Rincon', tiposdeidentificacion_id:'1', documento:'6793409423', departamento_id:'1'},
	{:avatar => File.open(File.join(Rails.root, "/public/system/avatares/1/thumb/lennon.png")),codigo: '01', cargo_id:'1', primer_nombre:'Luz', segundo_nombre:'Marina', apellido:'Gutierrez', tiposdeidentificacion_id:'1', documento:'4893409423', departamento_id:'1'},
	{:avatar => File.open(File.join(Rails.root, "/public/system/avatares/1/thumb/lennon.png")),codigo: '01', cargo_id:'2', primer_nombre:'Daniel', segundo_nombre:'', apellido:'Marin', tiposdeidentificacion_id:'1', documento:'3203409423', departamento_id:'3'}, 
	{:avatar => File.open(File.join(Rails.root, "/public/system/avatares/1/thumb/lennon.png")),codigo: '01', cargo_id:'1', primer_nombre:'Milvia', segundo_nombre:'', apellido:'Graciano', tiposdeidentificacion_id:'1', documento:'3203409423', departamento_id:'2'}])
=======
>>>>>>> 7af67e025f6dcd0df949761ad34a01b106dc673c

cargos = Cargo.create([{descripcion: 'Ejecutiva'}, {descripcion: 'Empleado'},])

departamentos = Departamento.create([{nombre: 'Mercadeo'}, {nombre: 'Calidad'},{nombre:'Reservas'}])

tiposdehabitaciones = Tiposdehabitacion.create([{tipo: 'CLASSIC'}, {tipo: 'EXECUTIVE'}, {tipo: 'SUITE'}, {tipo:'JUNIORSUITE'}])
